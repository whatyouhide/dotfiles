# Avoid running without the $VIM_CONFIG env variable set.
unless ENV.has_key?('VIM_CONFIG')
  puts '$VIM_CONFIG is not set'
  exit false
end

# Print some configuration infos.
puts "$VIM_CONFIG: #{ENV['VIM_CONFIG']}"

# Prepend a . to a filename, join its path into ~.
def home_dotted(file)
  File.join(Dir.home, '.' + file)
end

# Return the absolute path of a file in the vim config directory.
def abs(file)
  File.join(ENV['VIM_CONFIG'], file)
end


desc 'Symlink files to ~'
task :install do
  ln_sf abs(''), home_dotted('vim')
  ln_sf abs('vimrc'), home_dotted('vimrc')
  ln_sf abs('gvimrc'), home_dotted('gvimrc')
end

desc 'Remove all the generated symlinks from ~'
task :uninstall do
  rm_r home_dotted('vim')
  rm home_dotted('vimrc')
  rm home_dotted('gvimrc')
end
