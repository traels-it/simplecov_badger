require "test_helper"

class ConfigurationTest < Minitest::Test
  describe "#initialize" do
    it "Base64 encodes the repo_url" do
      configuration = SimplecovPostFormatter.configuration

      assert_equal "www.test-repo.com", Base64.urlsafe_decode64(configuration.encoded_repo_url)
    end
  end
end
