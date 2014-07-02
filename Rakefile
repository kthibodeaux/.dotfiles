require 'rake'

task :default do
  system('rake -T')
end

desc "List all files that :install and :uninstall will affect"
task :info do
  puts "Files that will be affected by :install and :uninstall"
  puts "-" * 10
  files.each { |f| puts f }
end

desc "Create symlinks in the user's home directory"
task :install do
  files.each { |f| try_create_symlink(f) }
end

def files
  Dir.entries('./').select { |directory| directory.start_with?('.') &&
    ! ['.', '..', '.git', '.gitignore', '.DS_Store'].include?(directory) }
end

def try_create_symlink(filename)
  source = File.expand_path("~/.dotfiles/#{filename}")
  target = File.expand_path("~/#{filename}")

  if File.exists?(target) || File.symlink?(target)
    puts "skipping #{filename}, ~/#{filename} already exists"
  else
    puts "symlinking ~/.dotfiles/#{filename} to ~/#{filename}"
    create_symlink(source, target)
  end
end

def create_symlink(source, target)
  File.symlink(source, target)
end
