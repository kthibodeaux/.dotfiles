local function get_file_extension(filename)
  local dot_index = filename:find("%.[^%.]+$")
  if dot_index then
    return filename:sub(dot_index + 1)
  else
    return ""
  end
end

local function get_alternate_filename()
  local filename = vim.api.nvim_eval("expand('%')")
  local extension = get_file_extension(filename)

  if(extension == "rb") then
    if filename:find("app/", 1, true) then
      return filename:gsub("app/", "spec/"):gsub("%.rb$", "_spec.rb")
    elseif filename:find("lib/", 1, true) then
      return filename:gsub("lib/", "spec/"):gsub("%.rb$", "_spec.rb")
    elseif filename:find("spec/", 1, true) then
      local app_filename = filename:gsub("spec/", "app/"):gsub("%_spec%.rb$", ".rb")
      local lib_filename = filename:gsub("spec/", "lib/"):gsub("%_spec%.rb$", ".rb")

      if vim.fn.filereadable(app_filename) == 1 then
        return app_filename
      elseif vim.fn.filereadable(lib_filename) == 1 then
        return lib_filename
      end
    end
  elseif(extension == "go") then
    if(filename:find("_test", 1, true)) then
      return filename:gsub("_test.go", ".go")
    else
      return filename:gsub(".go", "_test.go")
    end
  end
end

local function open()
  local alternate_filename = get_alternate_filename()

  if(alternate_filename == "") then
    print "No alternate file found"
  else
    vim.api.nvim_command('vsplit ' .. alternate_filename)
  end
end

return {
  open = open
}
