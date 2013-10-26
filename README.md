# Bitbucket::Cli

This gem is a plugin to git. Install it and have access to the bitbucket api directly from the git command.

## Installation

Simple install:

    $ gem install bitbucket-cli

## Usage

Currently only repository creation is supported (since this was what I needed).

    $ git bb account username password

This command stores your username and password in a clear text file called .gitbb in your home folder. (Yes, this is NOT secure).

    $ git bb repository create

Creates a repository named after the current directory

    $ git bb repository create repo-name

Creates a repository called "repo-name"

    $ git bb repository create -p

Creates a private repository

    $ git bb repository create --owner teamname

Creates a repository for the team "teamname" (you need to be member of that team off course)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
