# Prevent from running unless the $ZSH_CONFIG variable is set.
unless ENV.has_key?('ZSH_CONFIG')
  puts '$ZSH_CONFIG is not set'
  exit false
end

# Print out some infos.
puts "$ZSH_CONFIG: #{ENV['ZSH_CONFIG']}"

# zshrc -> $HOME/.zshrc
def home_dotted(file)
  File.join(Dir.home, '.' + file)
end

# Absolute path to a file in the zsh configuration directory.
def abs(zsh_file)
  File.join(ENV['ZSH_CONFIG'], zsh_file)
end

desc 'Symlink filesto ~'
task :install do
  # Copy zshenv.example to zshenv if needed.
  Rake::Task['zshenv'].invoke if !File.exist?('zshenv')

  ln_sf abs('zshrc'), home_dotted('zshrc')
  ln_sf abs('zshenv'), home_dotted('zshenv')
end

desc 'Remove symlinked files from ~'
task :uninstall do
  rm_f home_dotted('zshrc')
  rm_f home_dotted('zshenv')
end

desc 'Copy zshenv.example to zshenv'
task :copy_zshenv do
  cp 'zshenv.example', 'zshenv'
end
