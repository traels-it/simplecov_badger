require "test_helper"

class ConfigurationTest < Minitest::Test
  describe "#encoded_repo_url" do
    it "Base64 encodes the repo_url" do
      configuration = SimplecovBadger.configuration

      assert_equal "www.test-repo.com", Base64.urlsafe_decode64(configuration.encoded_repo_url)
    end
  end

  describe "default setup" do
    it "has a default for post url" do
      configuration = SimplecovBadger::Configuration.new

      assert_equal configuration.post_url, "coverage.traels.it/badges"
    end

    it "finds the repo_url from the project's git repo" do
      configuration = SimplecovBadger::Configuration.new

      assert_equal "https://github.com/traels-it/simplecov_badger.git", configuration.repo_url
    end

    it "has a run_if lamda, that only resolves to true, when in the master git branch" do
      skip "this test only works on the master branch"

      configuration = SimplecovBadger::Configuration.new

      assert configuration.run_if.call
    end
  end
end
