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
  Dir.mkdir(File.join(Dir.home, ".tmp")) unless File.exist?(File.join(Dir.home, ".tmp"))
  files.each { |f| try_create_symlink(f) }
  Dir.mkdir(File.join(Dir.home, ".vim/undodir")) unless File.exist?(File.join(Dir.home, ".vim/undodir"))
end

desc "Install vundle to ~/.vim"
task :vundle do
  `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
end

desc "Install FZF to ~/.fzf"
task :fzf do
  `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf`
  `~/.fzf/install`
end

desc "Install common packages from Homebrew"
task :brews do
  `brew install htop-osx npm nvim openssl p7zip reattach-to-user-namespace sqlite ssh-copy-id the_silver_searcher tmux tree unrar vim wget`
end

def files
  Dir.entries('./').select { |directory| directory.start_with?('.') &&
    ! ignore_list.include?(directory) }
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

def ignore_list
  [
    '.', '..', '.git', '.gitignore', '.DS_Store', '.osx', '.gitmodules'
  ]
end
