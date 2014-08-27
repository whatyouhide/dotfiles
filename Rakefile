if !ENV['VIM']
  puts '$VIM is not set'
  exit false
end

puts "$VIM: #{ENV['VIM']}"

def home_dotted(file)
  File.join(Dir.home, '.' + file)
end

def abs(file)
  File.join(ENV['VIM'], file)
end

desc 'Symlink files to ~'
task :install do
  ln_sf abs(''), home_dotted('vim')
  ln_sf abs('vimrc'), home_dotted('vimrc')
  ln_sf abs('gvimrc'), home_dotted('gvimrc')
end
