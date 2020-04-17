module SimpleCov::Badger
  class Configuration < OpenStruct
    def self.options
      {
        post_url: "coverage.traels.it/badges",
        repo_url: `git config --get remote.origin.url`,
        run_if: -> { `git rev-parse --abbrev-ref HEAD` == "master\n" }
      }
    end

    def initialize
      super(self.class.options)
    end

    def encoded_repo_url
      raise SimpleCov::Badger::Error, "repo_url is nil" if repo_url.nil?

      Base64.urlsafe_encode64(repo_url)
    end
  end
end
