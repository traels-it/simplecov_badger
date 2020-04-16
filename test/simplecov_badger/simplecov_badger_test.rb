require "test_helper"

class SimplecovBadgerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SimplecovBadger::VERSION
  end
end
