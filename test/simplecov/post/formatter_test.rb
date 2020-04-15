require "test_helper"

class Simplecov::Post::FormatterTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Simplecov::Post::Formatter::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
