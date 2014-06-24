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
  # Parse the YAML file which contains the links, it will be needed everywhere.
  @config = YAML.load_file(File.join(DOTFILES, 'config.yml'))
  class << self; attr_reader :config; end

  # Clone from options[:url] to options[:to]
  def self.git_clone(options)
    system "git clone #{options[:url]} #{options[:to]}"
  end

  module Symlinks
    @symlinks = H.config['symlinks']

    # Given a relative path (relative to DOTFILES), return the full path and prepend
    # a dot to the basename (if it hasn't got one already).
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
    end
  end
end



desc "Runs everything, suitable for new machines"
task :new_machine do
  %i(
    install
    create_directories
    zsh:themes
    zsh:syntax_highlighting
    vim:vundle
    tmuxinator_projects
  ).each { |task| Rake::Task[task].invoke }
end


desc "Create the necessary symlinks, overriding existing files in ~"
task :install do
  H::Symlinks.default.each do |src|
    dest = H::Symlinks.full_path_with_dot(src)

    # But why? Why removing the destination if it's a directory? Read more at
    # the end of this file.
    rm dest, verbose: false if File.directory?(dest)

    ln_sf src, dest
  end

  H::Symlinks.custom.each do |src, dest|
    ln_sf File.join(DOTFILES, src), File.expand_path(dest)
  end
end


desc "Clean the symlinks inside ~"
task :clean do
  H::Symlinks.all.each { |el| rm_f el }
end


desc "Create some useful directories"
task :create_directories do
  H.config['directories_to_create'].each { |dir| mkpath File.expand_path(dir) }
end


namespace :zsh do
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
    H.git_clone url: 'https://github.com/zsh-users/zsh-syntax-highlighting.git',
      to: '~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting'
  end
end


desc "Install the Vundle plugin manager"
namespace :vim do
  task :vundle do
    fail '~/.vim not found' unless File.exist? File.expand_path('~/.vim')

    H.git_clone url: 'https://github.com/gmarik/Vundle.vim.git',
      to: '~/.vim/bundle/Vundle.vim'
  end
end


desc "Symlink the tmuxinator projects directory to ~/.tmuxinator"
task :tmuxinator_projects do
  path = File.expand_path '~/Code/tmuxinator'

  unless File.exist?(path)
    H.git_clone url: 'git@github.com:whatyouhide/tmuxinator-projects.git',
      to: path
  end

  ln_sf path, File.expand_path('~/.tmuxinator')
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
