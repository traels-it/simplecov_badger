require "test_helper"

class SimpleCov::BadgerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil SimpleCov::Badger::VERSION
  end
end
