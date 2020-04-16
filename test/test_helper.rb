$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "simplecov"
SimpleCov.start
require "simplecov_badger"
require "minitest/autorun"
require 'minitest/unit'
require "mocha/minitest"

SimplecovBadger.configure do |config|
  config.post_url = "www.test-post.com"
  config.repo_url = "www.test-repo.com"
  config.run_when = -> { false }
end

def mock_result(total_cov)
  stub(source_files: stub(covered_percent: total_cov))
end

