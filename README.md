# Find-Size
## Usage
    require 'find'
    require 'find/size'

    Find.find('/') do |path|
      puts path + " " + Find::Size.get_size(path).size.to_s
    end
