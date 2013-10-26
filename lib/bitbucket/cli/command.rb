require 'thor'
require 'bitbucket/cli/commands/repository'
require 'bitbucket/cli/config'
module Bitbucket
  module Cli
    class Command < Thor
      class_option :account, :default => ''
      desc "repository SUBCOMMAND ...ARGS", "manage repositories"
      subcommand "repository", Bitbucket::Cli::Commands::Repository


        desc "account NAME PASSWORD", "adds a new account to config file"
        def account(name='', password='')
          Bitbucket::Cli::Config.new.add_account name, password
        end

    end
  end
end

