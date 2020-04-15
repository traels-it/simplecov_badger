$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "simplecov_post_formatter"

require "minitest/autorun"
require "mocha"
require "simplecov"
require "webmock/minitest"

SimpleCov.start do
  module SimplecovPostFormatter
    class Formatter
    end
  end

  SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::HTMLFormatter,
      SimplecovPostFormatter::Formatter
    ]
  )
end

SimplecovPostFormatter.configure do |config|
  config.post_url = "www.test-post.com"
  config.repo_url = "www.test-repo.com"
end

