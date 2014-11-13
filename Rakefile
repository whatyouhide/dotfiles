require 'yaml'

unless (DOTFILES = ENV['DOTFILES'])
  fail "The $DOTFILES environment variable is not set"
end

class String
  def /(rest_of_path); File.join(self, rest_of_path); end
  def expand; File.expand_path(self); end
  def exist?;  File.exist?(self); end
  def home_and_dotted; (Dir.home/self.dotted); end

  def dotted
    name = File.basename(self)
    name.start_with?('.') ? name : ('.' + name)
  end
end

class Array
  def to_list_of_dotfiles
    flat_map { |e| Dir[e] }.map { |e| (DOTFILES/e) }
  end
end


# Helper module.
module H
  # Parse the YAML config file only if it hasn't been already parsed.
  # ||= returns the value of @config either way.
  def self.config
    @config ||= YAML.load_file(DOTFILES/'config.yml')
  end

  def self.copy_zshenv
    return if (DOTFILES/'zsh/zshenv').exist?
    cp (DOTFILES/'zsh/zshenv.example'), (DOTFILES/'zsh/zshenv')
  end

  # Module to handle symlinks.
  module Symlinks
    extend Rake::FileUtilsExt
    @symlinks = H.config['symlinks']

    # Return an array of paths to the files that will be linked to ~.
    def self.default
      (@symlinks['default'] + @symlinks['personal-pc']).to_list_of_dotfiles
    end

    def self.personalpc_to_clean
      @symlinks['personal-pc'].to_list_of_dotfiles.map(&:home_and_dotted)
    end

    # Return an hash of [src, dest] paths.
    def self.custom
      @symlinks['custom']
    end

    # Return an array of all the final symlinks that should appear in ~.
    def self.all
      res = default.map(&:home_and_dotted)
      res += custom.map { |_, dest| dest.expand }
      res
    end

    # Install the default dotfiles inside ~.
    def self.install_default!
      default.each do |src|
        dest = src.home_and_dotted
        # Read more at the end of this file on why doing this.
        rm dest, verbose: false if File.directory?(dest)
        ln_sf src, dest
      end
    end

    # Install dotfiles with custom paths
    def self.install_custom!
      expanded = Hash[custom.map { |_, dst| [_, dst.expand] }]

      expanded.each do |src, dst|
        if File.dirname(dst).exist?
          ln_sf (DOTFILES/src), dst
        else
          warn "Not linking #{dst} because #{File.dirname(dst)} doesn't exist"
        end
      end
    end
  end
end


desc "Create the necessary symlinks, overriding existing files in ~"
task :install do
  H.copy_zshenv
  H::Symlinks.install_default!
  H::Symlinks.install_custom!
end


desc "Clean the symlinks inside ~"
task :clean do
  H::Symlinks.all.each { |el| rm_f el }
end

desc "Clean non-personal-pc dotfiles"
task :clean_non_personalpc do
  H::Symlinks.personalpc_to_clean.each { |el| rm_f el }
end

desc "Create some useful directories"
task :create_directories do
  H.config['directories_to_create'].each { |dir| mkpath dir.expand }
end

namespace :vim do
  desc "Install the vim-plug plugin manager"
  task :plug do
    mkdir_p '~/.vim/autoload'.expand
    system 'curl --progress-bar -o ~/.vim/autoload/plug.vim \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    system 'vim +PlugInstall +qall'
  end

  desc '"Import error"? SEGFAULT? Explosions around your house? vim:halp ftw!'
  task :halp do
    def brew(cmd); puts "Running 'brew #{cmd}'"; system "brew #{cmd}"; end
    system 'rvm use system'
    brew 'update'
    brew 'unlink python'
    brew 'uninstall macvim'
    brew 'cleanup -s'
    brew 'install macvim --override-system-vim --with-lua --with-luajit'
    brew 'linkapps'
    brew 'link python'
  end
end

task :chsh do
  path = '/usr/local/bin/zsh'
  fail('Install zsh with brew!') unless path.exist?
  system "sudo echo #{path} >> /etc/shells"
  system "chsh #{`whoami`} -s #{path}"
end

desc "Clone the tmuxinator projects to ~/.tmuxinator"
task :tmuxinator_projects do
  system 'git clone git@github.com:whatyouhide/tmuxinator-projects.git'
end


# When there's no ~/.vim directory, everything goes fine,
#
# When ~/.vim is already there though, ln_s sees it as a directory.
# As stated in the docs for FileUtils, if the target of ln_s is a dir then the
# link will be dest/src.
# So, ~/.vim being a directory, the link will be ~/.vim/vim.  Since every
# modification to the interiors of ~/.vim (the symlink) will bubble up to the
# actual dotfiles/vim (that's how symlinks work, isn't it?), we would have
# dotfiles/vim/vim. That link would point to dotfiles/vim.
#
# So, just remove every src directory before linking should be fine.
