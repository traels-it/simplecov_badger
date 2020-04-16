require "test_helper"

class ConfigurationTest < Minitest::Test
  describe "#encoded_repo_url" do
    it "Base64 encodes the repo_url" do
      configuration = SimplecovPostFormatter.configuration

      assert_equal "www.test-repo.com", Base64.urlsafe_decode64(configuration.encoded_repo_url)
    end
  end

  describe "default setup" do
    it "has a default for post url" do
      configuration = SimplecovPostFormatter::Configuration.new

      assert_equal configuration.post_url, "coverage.traels.it/badges"
    end

    it "finds the repo_url from the project's git repo" do
      configuration = SimplecovPostFormatter::Configuration.new

      assert_equal "https://github.com/traels-it/simplecov-post-formatter.git", configuration.repo_url
    end
  end
end
