# SimplecovBadger
This gem is a formatter for SimpleCov. It sends the total test coverage from SimpleCov to a url via a post request.
It is heavily inspired by the formatter in MarcGrimme's simplecov-small-badge: https://github.com/MarcGrimme/simplecov-small-badge
The gem is connected with our simplecov badge service for rendering badge .svgs. See more at: https://coverage.traels.it

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simplecov_badger'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install simplecov_badger

## Usage

There are very few things to do, before you can use the gem. The only necessary setup is to add the `SimplevocBadger::Formatter` to `SimpleCov`'s formatters in the same place you start `SimpleCov`:

```ruby
SimpleCov.start do
  SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::HTMLFormatter,
      SimplecovBadger::Formatter # <-- this one
    ]
  )
end
```

After running your test suite on your master branch, you can find a badge on the url https://coverage.traels.it/badges/[Base64.urlsafe_encode64(your_repo_url)]
Subsequent runs will update the badge on the same url.

The gem comes with a standard configuration. If you want to override any of these (three) settings, it can be done like this:

```ruby
# this is the standard configuration
SimplecovBadger.configure do |config|
  config.post_url = "coverage.traels.it/badges",
  config.repo_url = `git remote -v`.split(" ")[1],
  config.run_when = -> { `git rev-parse --abbrev-ref HEAD` == "master\n" }
end
```
Changing the `post_url` changes where the gem posts the coverage to and as a result you will have to make a service for drawing badges yourself.
The `repo_url` defaults to the git remote of the project you work on.
The `run_when` defaults to a lambda, that returns true if your current branch is master. This means the badge is only updated, when the test suite is run on the master branch. If replaced, it should be with another lambda that returns true whenever you want the badge updated.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/traels-it/simplecov_badger


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
