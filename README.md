# SimpleCov::Badger
This gem is a formatter for SimpleCov. It sends the total test coverage from SimpleCov to a url via a post request.
The gem is connected with our simplecov badge service for rendering badge .svgs. See more at: https://coverage.traels.it

## Installation

Add this line to your application's Gemfile in the test, development group:

```ruby
group :development, :test do
  gem 'simplecov_badger'
end
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install simplecov_badger

Then run

    $ bundle exec rake simplecov_badger:install

## Usage

There are very few things to do, before you can use the gem. The only necessary setup is to add the `SimpleCov::Badger::Formatter` to `SimpleCov`'s formatters in the same place you start `SimpleCov`:

```ruby
SimpleCov.start do
  SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Badger::Formatter # <-- this one
    ]
  )
end
```

And then setting the token you received from the install rake task in an env somewhere, for example by using the [dotenv](https://rubygems.org/gems/dotenv) gem:

If you use rails we recommend setting the token in the [credentials](https://guides.rubyonrails.org/security.html#custom-credentials) instead and conf.
```ruby
# in config/initializers/simplecov_badger.rb
SimpleCov::Badger.configure do |config|
  config.token = Rails.application.credentials.simplecov_badger[:token]
end
```

After running your test suite on your master branch, a url for your badge will be printed in the console.
Subsequent runs will update the badge on the same url.

The gem comes with a standard configuration. If you want to override any of these settings, it can be done like this:

```ruby
# this is the standard configuration
SimpleCov::Badger.configure do |config|
  config.post_url = "coverage.traels.it/badges",
  config.repo_url = `git config --get remote.origin.url`.strip,
  config.run_if = -> { `git rev-parse --abbrev-ref HEAD` == "master\n" }
  config.token = ENV["SIMPLECOV_BADGER_TOKEN"]
end
```
Changing the `post_url` changes where the gem posts the coverage to and as a result you will have to make a service for drawing badges yourself.
The `repo_url` defaults to the git repo's origin url.
The `run_if` defaults to a lambda, that returns true if your current branch is master. This means the badge is only updated, when the test suite is run on the master branch. If replaced, it should be with another lambda that returns true whenever you want the badge updated.
`token` is used when updating your badge with a new coverage. It defaults to reading from an env variable. When running the install rake task, a token is saved at your projects root in a file called `.simplecov_badger_auth_token`. It is recommended to set this token as an env variable, when not running Rails. If you do use Rails, set the token in your test credentials and configure to read from there instead. Should you lose your token, there is currently no recovery process, but you can configure your repo_url to something else and run the install task again to get a new token.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/traels-it/simplecov_badger


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
