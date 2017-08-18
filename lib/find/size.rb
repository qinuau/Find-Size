class Find::Size
  class Result
    attr_accessor :path, :size

    def initialize(path, size = nil)
      @path = path
      @size = size
    end
  end

  class << Find::Size
    def get_size(path, size_least = nil)
      if (File.directory?(path))
        size = 0
        Dir.glob(path + '/**/*').each do |path_each|
          begin
            size += File.size(path_each)
          rescue

          end
        end
      else
        begin
          size = File.stat(path).size
        rescue
          size = 0
        end
      end

      if size_least != nil
        if size >= size_least
          return return_result(path, size)
        end
      else
        return return_result(path, size)
      end
    end

    def return_result(path, size)
      return Find::Size::Result.new(path, size)
    end
  end
end
