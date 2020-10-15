local function get_filename()
  return vim.api.nvim_eval("expand('%')")
end

local function convert_to_app_filename(filename)
  local app_filename = filename:gsub("app/", "spec/")
  return app_filename:gsub(".rb", "_spec.rb")
end

local function convert_to_spec_filename(filename)
  local spec_filename = filename:gsub("spec/", "app/")
  return spec_filename:gsub("_spec.rb", ".rb")
end

local function get_alternate_filename()
  local filename = get_filename()

  if(filename:find("app/", 1, true)) then
    return convert_to_app_filename(filename)
  elseif(filename:find("spec/", 1, true)) then
    return convert_to_spec_filename(filename)
  end

  return(alternate_filename)
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
