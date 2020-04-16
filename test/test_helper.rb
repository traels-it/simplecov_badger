$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "simplecov_badger"
require "minitest/autorun"
require 'minitest/unit'
require "mocha/minitest"
require "simplecov"

SimpleCov.start do
  SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::HTMLFormatter,
      SimplecovBadger::Formatter
    ]
  )
end

SimplecovBadger.configure do |config|
  config.post_url = "www.test-post.com"
  config.repo_url = "www.test-repo.com"
  config.run_when = -> { true }
end


def mock_result(total_cov)
  stub(source_files: stub(covered_percent: total_cov))
end

