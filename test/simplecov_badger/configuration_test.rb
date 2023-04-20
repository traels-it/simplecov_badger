require "test_helper"

class ConfigurationTest < Minitest::Test
  describe "#encoded_repo_url" do
    it "Base64 encodes the repo_url" do
      configuration = SimpleCov::Badger.configuration

      assert_equal "www.test-repo.com", Base64.urlsafe_decode64(configuration.encoded_repo_url)
    end
  end

  describe "default setup" do
    it "has a default for post url" do
      configuration = SimpleCov::Badger::Configuration.new

      assert_equal configuration.post_url, "https://coverage.traels.it/badges"
    end

    it "finds the repo_url from the project's git repo" do
      configuration = SimpleCov::Badger::Configuration.new

      assert configuration.repo_url.include? "github.com"
      assert configuration.repo_url.include? "simplecov_badger.git"
    end

    it "has a run_if lamda" do
      configuration = SimpleCov::Badger::Configuration.new

      assert configuration.run_if.lambda?
    end

    it "looks in an env variable for authentication token" do
      ENV["SIMPLECOV_BADGER_TOKEN"] = "something"
      configuration = SimpleCov::Badger::Configuration.new

      assert_equal "something", configuration.token
    end
  end

  describe "#badge_url" do
    it "returns the full url to the badge (on the assumption that the configuration conforms to our standard)" do
      configuration = SimpleCov::Badger::Configuration.new

      assert configuration.badge_url.include? "coverage.traels.it/badges/"
      assert configuration.badge_url.length > 85
    end
  end
end
