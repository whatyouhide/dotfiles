require 'yaml'

# Some colors for better prints.
COLORS = {
  green: "\033[1;32m",
  violet: "\033[1;34m",
  red: "\033[1;31m",
  end: "\033[0m"
}

# The location of these dotfiles.
DOTFILES = ENV['DOTFILES']
fail "The $DOTFILES environment variable is not set" if not DOTFILES


desc "Symlink files listed in $DOTFILES/links to ~, prepending them with a '.'"
task symlink: 'symlink:default'

namespace :symlink do
  # Prepends a "." to a filename if it hasn't already
  def prepend_dot(file)
    file.start_with?('.') ? file : '.'.concat(file)
  end

  # Expands a given dotfile name (taken from ~/dotfiles/links)
  def expand_path(dotfile_glob)
    Dir.glob(File.join(DOTFILES, dotfile_glob))
  end

  # Read links to make from ~/dotfiles/links
  def read_links
    links = YAML.load_file(File.join(DOTFILES, 'links.yml'))
    links['home']
  end

  # Get an array of full dotfiles paths
  def turn_to_good_dotfiles(dirty_array)
    dirty_array.map { |df| expand_path(df) }.flatten
  end

  def dest_path_from_dotfile(df_path)
    File.join(Dir.home, prepend_dot(File.basename df_path))
  end

  # Remove a given link
  def remove_link(link)
    File.delete(link)
    puts "#{COLORS[:violet]}Removed#{COLORS[:end]}: #{link}"
  end

  task :default do
    Rake::Task['symlink:zsh_themes'].invoke

    turn_to_good_dotfiles(read_links).each do |df_path|
      dest_path = dest_path_from_dotfile(df_path)

      if File.exists?(dest_path)
        puts "#{dest_path} #{COLORS[:red]}already exists#{COLORS[:end]} \
             (couldn't link #{df_path})"
      else
        File.symlink(df_path, dest_path)
        puts "#{COLORS[:green]}Linked#{COLORS[:end]} #{df_path} to #{dest_path}"
      end

      puts "#{COLORS[:green]}Linked#{COLORS[:end]} ssh/config to ~/.ssh/config"
      File.symlink(File.join(DOTFILES, 'ssh/config'),
        File.join(Dir.home, '.ssh', 'config'))
    end
  end

  desc "Remove all symlinks"
  task :clean do
    turn_to_good_dotfiles(read_links).each do |df_path|
      dest_path = dest_path_from_dotfile(df_path)
      if File.exists?(dest_path)
        remove_link(dest_path)
      end
    end
  end

  desc "Forced symlinking"
  task :force do
    Rake::Task['symlink:clean'].invoke
    Rake::Task['symlink:default'].invoke
  end

  desc "Link zsh themes in zsh/*.zsh-theme to ~/.oh-my-zsh/themes"
  task :zsh_themes do
    themes = Dir["zsh/themes/*.zsh-theme"]
    themes.each do |theme|
      src = File.join(DOTFILES, theme)
      dest = File.join(Dir.home, ".oh-my-zsh", "themes", File.basename(theme))
      File.delete(dest) if File.exists?(dest)
      File.symlink(src, dest)
      puts "Linked #{COLORS[:green]}#{src}#{COLORS[:end]} to #{COLORS[:violet]} \
            #{dest}#{COLORS[:end]}"
    end
  end

end

# Generic setup
desc "Setup some stuff that wasn't in the 'install' script"
task setup: 'setup:default'

namespace :setup do
  task :default do
    Rake::Task['setup:filesystem'].invoke
    Rake::Task['setup:zsh_syntax_highlighting'].invoke
    Rake::Task['setup:brew_autocompletion'].invoke
  end

  desc "Structures the filesystem adding some directories to ~"
  task :filesystem do
    %w{tmp Code Sites Transmission}.map do |el|
      File.join(Dir.home, el)
    end.each do |el|
      makedirs el
    end
  end

  desc "Add the zsh-syntax-highlighting plugin to oh-my-zsh"
  task :zsh_syntax_highlighting do
    system 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
            ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting'
  end

  desc "Autocompletion for Homebrew"
  task :brew_autocompletion do
    puts 'About to install brew autocompletion. I need root permissions.'
    brew_prefix = `brew --prefix`
    system "sudo ln -sv \
            '#{brew_prefix}/Library/Contributions/brew_zsh_completion.zsh' \
            /usr/local/share/zsh/site-functions"
  end

end
