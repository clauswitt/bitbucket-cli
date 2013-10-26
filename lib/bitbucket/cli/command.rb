require 'json'
module Bitbucket
  module Cli
    class Command
      def initialize
      end

      def run
        puts ARGV.to_json
      end
    end
  end
end

