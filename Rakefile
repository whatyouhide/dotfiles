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


desc "Symlink the config files listed in .dotfiles/links to ~ after prepending them with a '.'"
task :symlink, :force, :clean do |t, args|

  dotfiles = []
  File.open(File.join(Dir.home, '.dotfiles', 'links'), 'r').each_line do |line|
    dotfiles << line.strip unless line =~ /^#/ or line =~ /^\s+$/
  end

  GREEN = "\033[1;32m"
  VIOLET = "\033[1;34m"
  RED = "\033[1;31m"
  E = "\033[0m"

  # Prepends a "." to a filename if it hasn't already
  def prepend_dot(file)
    file =~ /^\./ ? file : ".#{file}"
  end

  # Expands a given dotfile name (taken from $dotfile)
  def expand_path(dotfile_glob)
    Dir.glob(File.join(Dir.home, ".dotfiles", dotfile_glob))
  end

  # Expand every $dotfile, flatten the resulting array and link each element)
  dotfiles.map { |df| expand_path(df) }.flatten.each do |df_path|
    dest_path = File.join(Dir.home, prepend_dot(File.basename df_path))

    if File.exists?(dest_path)
      if args[:force]
        File.delete dest_path
        puts "#{VIOLET}Removed#{E} #{dest_path}"
        next
      elsif args[:clean]
        File.delete dest_path
        puts "#{VIOLET}Removed#{E} #{dest_path}"
      else
        puts "#{dest_path} #{RED}already exists#{E} (couldn't link #{df_path})"
        next
      end
    end

    File.symlink(df_path, dest_path)
    puts "#{GREEN}Linked#{E} #{df_path} to #{dest_path}"
  end

end
