module Fixtures

    def self.load_config(file_path)
      @config = YAML.load_file file_path
      #@config = @config[PROFILE]
    end

    def self.[] (key)
      res = @config
      key = key.to_s if key.is_a? Symbol

      if key.include? ('.')
        arr = key.split('.')
        arr.each do |item|
          res = res.fetch(item)
        end
        res
      else
        res.fetch(key)
      end
    rescue
      return ''
    end
end