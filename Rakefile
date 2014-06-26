require 'yaml'


# The location of these dotfiles.
# Exit gracefully if the $DOTFILES env variable is not set.
DOTFILES = ENV['DOTFILES']
unless DOTFILES
  puts "The $DOTFILES environment variable is not set"
  puts "Re-run the task: DOTFILES=... rake {{task}}"
  exit false
end


# Helper module.
module H
  # Parse the YAML config file only if it hasn't been already parsed.
  # ||= returns the value of @config either way.
  def self.config
    @config ||= YAML.load_file(File.join(DOTFILES, 'config.yml'))
  end

  def self.github_clone(relative_url, to)
    system "git clone https://github.com/#{relative_url}.git #{to}"
  end

  def self.my_github_clone(repo_name, to)
    system "git clone git@github.com:whatyouhide/#{repo_name}.git #{to}"
  end

  # Check if a file exists after expanding its path.
  def self.file_exists?(path)
    File.exist? File.expand_path(path)
  end

  # Module to handle symlinks.
  module Symlinks
    extend Rake::FileUtilsExt
    @symlinks = H.config['symlinks']

    # Given a relative path (relative to DOTFILES), return the full path and
    # prepend a dot to the basename (if it hasn't got one already).
    def self.full_path_with_dot(dotfile)
      dotted = File.basename(dotfile)
      dotted = '.' + dotted unless dotted =~ /^\./
      File.join(Dir.home, dotted)
    end

    # Return an array of paths to the files that will be linked to ~.
    def self.default
      @symlinks['default']
        .flat_map { |el| Dir[el] }
        .map { |el| File.join(DOTFILES, el) }
    end

    # Return an hash of [src, dest] paths.
    def self.custom
      @symlinks['custom']
    end

    # Return an array of all the final symlinks that should appear in ~.
    def self.all
      res = default.map { |el| full_path_with_dot(el) }
      res += custom.map { |_, dest| File.expand_path(dest) }
      res
    end

    # Install the default dotfiles inside ~.
    def self.install_default!
      default.each do |src|
        dest = full_path_with_dot(src)

        # But why? Why removing the destination if it's a directory? Read more
        # at the end of this file.
        rm dest, verbose: false if File.directory?(dest)

        ln_sf src, dest
      end
    end

    # Install dotfiles with custom paths
    def self.install_custom!
      expanded = Hash[custom.map { |_, dst| [_, File.expand_path(dst)] }]

      expanded.each do |src, dst|
        if File.exist?(File.dirname(dst))
          ln_sf File.join(DOTFILES, src), dst
        else
          warn "Not linking #{dst} because #{File.dirname(dst)} doesn't exist"
        end
      end
    end
  end
end



desc "Runs everything, suitable for new machines"
task :new_machine do
  H.config['new_machine_tasks'].each { |task| Rake::Task[task].invoke }
end


desc "Create the necessary symlinks, overriding existing files in ~"
task :install do
  H::Symlinks.install_default!
  H::Symlinks.install_custom!
end


desc "Clean the symlinks inside ~"
task :clean do
  H::Symlinks.all.each { |el| rm_f el }
end


desc "Create some useful directories"
task :create_directories do
  H.config['directories_to_create'].each { |dir| mkpath File.expand_path(dir) }
end


desc "Install RVM with the latest ruby version (ignoring dotfiles)"
task :rvm do
  system 'curl -sSL https://get.rvm.io | bash -s stable --ruby --ignore-dotfiles'
end


namespace :zsh do
  desc "Install oh-my-zsh"
  task :oh_my_zsh do
    if H.file_exists? '~/.oh-my-zsh'
      puts 'oh-my-zsh already installed at ~/.oh-my-zsh. Doing nothing.'
    else
      H.github_clone 'robbyrussell/oh-my-zsh', '~/.oh-my-zsh'
      system 'chsh -s `which zsh`'
    end
  end

  desc "Symlink custom oh-my-zsh themes"
  task :themes do
    Dir['zsh/themes/*'].each do |theme|
      ln_sf(
        File.join(DOTFILES, theme),
        File.join(Dir.home, '.oh-my-zsh/themes', File.basename(theme))
      )
    end
  end

  desc "Add the zsh-syntax-highlighting plugin to oh-my-zsh"
  task :syntax_highlighting do
    H.github_clone 'zsh-users/zsh-syntax-highlighting',
      '~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting'
  end
end


desc "Install the Vundle plugin manager"
namespace :vim do
  task :vundle do
    fail '~/.vim not found' unless H.file_exists?('~/.vim')
    H.github_clone 'gmarik/Vundle.vim', '~/.vim/bundle/Vundle.vim'
  end
end


desc "Clone the tmuxinator projects to ~/.tmuxinator"
task :tmuxinator_projects do
  H.my_github_clone 'tmuxinator-projects', '~/.tmuxinator'
end



# ------------------------------------------------------------------------------
# Wtf?
# an essay by Andrea Leopardi
#
# When there's no ~/.vim directory, everything goes fine. ln_s links
# dotfiles/vim to ~/.vim with no hassle.
#
# When ~/.vim is already there though, ln_s sees it as a directory.
# As stated in the docs for FileUtils, if the target of ln_s is a dir then the
# link will be dest/src.
# So, ~/.vim being a directory, the link will be ~/.vim/vim.
# Since every modification to the interiors of ~/.vim (the symlink) will bubble
# up to the actual dotfiles/vim (that's how symlinks work, isn't it?), we would
# have a dotfiles/vim/vim link on every 'rake install'. That link would point to
# dotfiles/vim, being effectively a link to its parent directory.
#
# So, just remove every src directory before linking should be fine.
