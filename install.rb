files = [
  '.emacs.d',
  '.gitconfig',
  '.gitmessage',
  '.rspec'
]

files.each do |file|
  target_file = File.expand_path("~/#{ file }")
  source_file = File.expand_path("~/.dotfiles/#{ file }")

  puts "skipping #{ target_file }" if File.exists?(target_file)

  unless File.exists?(target_file) || File.symlink?(target_file)
    File.symlink(source_file, target_file)
  end
end
