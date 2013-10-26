require 'yaml'
module Bitbucket
  module Cli
    class Config
      def initialize
        @default_config = {
          :accounts => [],
        }
        config_from_file
      end

      def add_account name, password
        @config[:accounts] << {:name => name, :password => password}
        write_file
      end

      def get_account name=''
        return nil if @config.nil?
        return nil if @config[:accounts].empty?
        return @config[:accounts].first if name == ''
        accounts = @config[:accounts].select {|a| a.has_key?(name)}
        return nil if accounts.empty?
        return accounts.first
      end


      def write key, val
        @config[key] = val
        write_file
      end

      def path
        File.join(ENV['HOME'], '.gitbb')
      end

      def config_from_file
        begin
          config = YAML::load(IO.read(path))
        rescue Errno::ENOENT
          $stderr.puts(:warning, "YAML configuration file couldn't be found. Using defaults.");
        rescue Psych::SyntaxError
          $stderr.puts(:warning, "YAML configuration file contains invalid syntax. Using defaults.");
        end
        configure(config)
      end

      def write_file
        File.open(path, 'w') {|f| f.write @config.to_yaml }
      end

      def configure config=nil
        if config
          @config = config
        else
          @config = @default_config
        end
      end
    end
  end
end

