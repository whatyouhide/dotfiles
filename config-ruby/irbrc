# Custom gem require - raise an error if the gem can't be found,
# pass a block of code to execute if the gem is available.
def req(gem_name, &block)
  begin
    require gem_name
    block.call if block
  rescue LoadError => err
    warn "Couldn't load #{gem_name}."
  end
end

req 'irbtools'