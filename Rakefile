require 'yaml'


# The location of these dotfiles.
DOTFILES = ENV['DOTFILES']
fail "The $DOTFILES environment variable is not set" if not DOTFILES


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


desc "Create the necessary symlinks, overriding existing files in ~"
task :install do
  default_sources.each do |src|
    ln_sf src, dot_destination_path(src)
  end

  custom_sources.each do |src, dest|
    ln_sf File.join(DOTFILES, src), homify(dest)
  end
end


desc "Clean the symlinks inside ~"
task :clean do
  targets = default_sources.map { |el| dot_destination_path(el) }
  targets += custom_sources.map { |_, dest| homify(dest) }
  targets.each { |el| rm el }
end


desc "Symlink custom oh-my-zsh themes"
task :zsh_themes do
  Dir['zsh/themes/*'].each do |theme|
    p theme
    ln_sf File.join(DOTFILES, theme),
      File.join(Dir.home, '.oh-my-zsh/themes', File.basename(theme))
  end
end


namespace :setup do
  desc "Add the zsh-syntax-highlighting plugin to oh-my-zsh"
  task :zsh_syntax_highlighting do
    system 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
            ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting'
  end
end
