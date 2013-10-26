require 'bitbucket_rest_api'
require 'thor'
require 'bitbucket/cli/config'
module Bitbucket
  module Cli
    module Commands
      class Repository < Thor
        class_option :account, :default => ''
        desc "create NAME [-p] [-r|--remote]", "creates a repository on bitbucket"
        option :p, :type => :boolean, :banner => 'private', :default => false
        option :skip_remote, :type => :boolean, :aliases => :s
        option :owner, :default => ''
        option :issues, :type => :boolean, :default => true, :aliases => :i
        option :wiki, :type => :boolean, :default => true, :aliases => :w
        option :description, :default => '', :aliases => :d
        option :website, :default => ''
        def create(name='')
          a = account(options[:account])
          if a.nil?
            puts 'No account, you need to select an account, or perhaps, create a new one?'
            return
          end
          name = File.basename(Dir.getwd) if name == ''
          bitbucket = BitBucket.new({:login=>a[:name], :password=>a[:password]})
          repo = bitbucket.repos.create(repo_options(name, options))
          if options[:skip_remote].nil?
            `git remote add origin git@bitbucket.org:#{repo['owner']}/#{repo['name']}.git`
          end
        end

        no_commands do
          def account name
            Bitbucket::Cli::Config.new.get_account name
          end

          def repo_options name, options
            opts = {
              "name" => name,
              "description" => options[:description],
              "website" => options[:website],
              "is_private" => options[:p],
              "has_issues" => options[:issues],
              "has_wiki" => options[:wiki]
            }
            opts['owner'] = options[:owner] unless @options[:owner] == ''
            return opts
          end
        end
      end
    end
  end
end

