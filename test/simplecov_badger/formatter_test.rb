require "test_helper"

class FormatterTest < Minitest::Test
  describe "#initialize" do
    it "is initialized with a configuration" do
      formatter = SimpleCov::Badger::Formatter.new

      refute_nil formatter.config.repo_url
      refute_nil formatter.config.post_url
    end
  end

  describe "#format" do
    it "sends a post request to the post_url with a total coverage result" do
      fake_config = stub(post_url: "fake-url", encoded_repo_url: "3nC0ded", run_if: stub(call: true), badge_url: "fake-url/3nC0ded")
      formatter = SimpleCov::Badger::Formatter.new
      formatter.stubs(config: fake_config)
      RestClient.expects(:post).with(formatter.config.post_url, { percentage: 92.43, repo_url: formatter.config.encoded_repo_url })

      formatter.format(mock_result(92.43))
    end

    it "does not run when run_if evaluates to false" do
      fake_config = stub(post_url: "fake-url", encoded_repo_url: "3nC0ded", run_if: stub(call: false))
      formatter = SimpleCov::Badger::Formatter.new
      formatter.stubs(config: fake_config)
      RestClient.expects(:post).never

      formatter.format(mock_result(92.43))
    end
  end
end
