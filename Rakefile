require 'yaml'


# The location of these dotfiles.
DOTFILES = ENV['DOTFILES']

# Exit gracefully if the $DOTFILES env variable is not set.
unless DOTFILES
  puts "The $DOTFILES environment variable is not set"
  puts "Re-run the task with:"
  puts "  DOTFILES={{dotfiles}} rake {{task}}"
  exit 1
end


# Parse the YAML file which contains the links, it will be needed everywhere.
CONFIG = YAML.load_file('links.yml')


# Return an array of paths to the files that will be linked to ~.
def default_sources
  relatives = CONFIG['default'].map { |el| Dir[el] }.flatten
  relatives.map { |el| File.join(DOTFILES, el) }
end

# Return an hash of [src, dest] paths.
def custom_sources
  CONFIG['custom']
end

# Given a relative path (relative to DOTFILES), return the full path and prepend
# a dot to the basename (if it hasn't got one already).
def dot_destination_path(dotfile)
  dotted = File.basename(dotfile)
  dotted = '.' + dotted unless dotted =~ /^\./
  File.join(Dir.home, dotted)
end

# Replace an initial ~ with the home path.
def homify(path)
  path.sub(/^~/, Dir.home)
end


desc "Runs everything, suitable for new machines"
task :new_machine do
  Rake::Task['install'].invoke
  Rake::Task['filesystem'].invoke
  Rake::Task['zsh_themes'].invoke
  Rake::Task['zsh_syntax_highlighting'].invoke
  Rake::Task['install_vundle'].invoke
  Rake::Task['tmuxinator_projects'].invoke
end


desc "Create the necessary symlinks, overriding existing files in ~"
task :install do
  default_sources.each do |src|
    dest = dot_destination_path(src)

    # But why? Why removing the destination if it's a directory? Well I don't
    # know. Ask FileUtils maybe. Really wanna know why? Read the notes at the
    # end of this file :).
    if File.directory?(dest)
      rm dest, verbose: false
    end

    ln_sf src, dest
  end

  custom_sources.each do |src, dest|
    ln_sf File.join(DOTFILES, src), homify(dest)
  end
end


desc "Clean the symlinks inside ~"
task :clean do
  targets = default_sources.map { |el| dot_destination_path(el) }
  targets += custom_sources.map { |_, dest| homify(dest) }
  targets.each { |el| rm_f el }
end


desc "Create some useful directories"
task :filesystem do
  %w(Code Transmission tmp).each do |dir|
    mkdir File.join(Dir.home, dir)
  end
end


desc "Symlink custom oh-my-zsh themes"
task :zsh_themes do
  Dir['zsh/themes/*'].each do |theme|
    ln_sf File.join(DOTFILES, theme),
      File.join(Dir.home, '.oh-my-zsh/themes', File.basename(theme))
  end
end


desc "Add the zsh-syntax-highlighting plugin to oh-my-zsh"
task :zsh_syntax_highlighting do
  system 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
          ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting'
end


desc "Install the Vundle plugin manager"
task :install_vundle do
  fail unless File.exist?(File.join(Dir.home, '.vim'))
  system 'git clone https://github.com/gmarik/Vundle.vim.git \
          ~/.vim/bundle/Vundle.vim'
end


desc "Symlink the tmuxinator projects directory to ~/.tmuxinator"
task :tmuxinator_projects do
  path = File.join(Dir.home, 'Code', 'tmuxinator')

  unless File.exist?(path)
    system "git clone git@github.com:whatyouhide/tmuxinator-projects.git \
           #{path}"
  end

  ln_sf path, File.join(Dir.home, '.tmuxinator')
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
