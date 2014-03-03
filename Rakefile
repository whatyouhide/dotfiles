
COLORS = {
  green: "\033[1;32m",
  violet: "\033[1;34m",
  red: "\033[1;31m",
  end: "\033[0m"
}



desc "Symlink the config files listed in .dotfiles/links to ~ after prepending them with a '.'"
task symlink: 'symlink:default'

namespace :symlink do
  # Prepends a "." to a filename if it hasn't already
  def prepend_dot(file)
    file.start_with?('.') ? file : '.'.concat(file)
  end

  # Expands a given dotfile name (taken from ~/.dotfiles/links)
  def expand_path(dotfile_glob)
    Dir.glob(File.join(Dir.home, ".dotfiles", dotfile_glob))
  end

  # Read links to make from ~/.dotfiles/links
  def read_links
    dotfiles = []
    File.open(File.join(Dir.home, '.dotfiles', 'links'), 'r').each_line do |line|
      dotfiles << line.strip unless line.start_with?('#') or line =~ /\A\s+\z/
    end
    dotfiles
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
    turn_to_good_dotfiles(read_links).each do |df_path|
      dest_path = dest_path_from_dotfile(df_path)

      if File.exists?(dest_path)
        puts "#{dest_path} #{COLORS[:red]}already exists#{COLORS[:end]} (couldn't link #{df_path})"
      else
        File.symlink(df_path, dest_path)
        puts "#{COLORS[:green]}Linked#{COLORS[:end]} #{df_path} to #{dest_path}"
      end

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

end

# Generic setup
namespace :setup do
  desc "Structures the filesystem adding some directories to ~"
  task :filesystem do
    %w{tmp Development Sites Transmission}.map do |el|
      File.join(Dir.home, el)
    end.each do |el|
      makedirs el
    end
  end
end
