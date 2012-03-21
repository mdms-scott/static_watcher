# StaticWatcher

Watch and compile Haml, Sass, Scss, and Coffeescript.

## Installation

Static Watcher requires coffeescript to be installed. See http:coffeescript.org for instructions.

Add this line to your application's Gemfile:

    gem 'static_watcher'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install static_watcher

In a new project run:

    $ static_watcher:install

or

    $ bundle exec static_watcher:install

as appropriate.  This will generate the folders which Static Watcher compiles from/into.  The directory structure is:

    /src/haml
    /src/sass
    /src/coffeescripts

which compile, respectively, into:

    /public
    /public/stylesheets
    /public/javascripts

## Usage

Simply execute

    $ static_watcher

or:

    $ bundle exec static_watcher

and user ctrl-c to stop.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
