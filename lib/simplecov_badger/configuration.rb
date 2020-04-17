module SimplecovBadger
  class Configuration
    def self.options
      {
        post_url: "coverage.traels.it/badges",
        repo_url: `git config --get remote.origin.url`,
        run_if: -> { `git rev-parse --abbrev-ref HEAD` == "master\n" }
      }
    end

    options.keys.each do |opt|
      define_method(opt) { instance_variable_get "@#{opt}" }
      define_method("#{opt}=") { |val| instance_variable_set("@#{opt}", val) }
    end

    def initialize(**opts)
      SimplecovBadger::Configuration.options.merge(opts).each { |opt, v| send(:"#{opt}=", v) }
    end

    def encoded_repo_url
      raise SimplecovBadger::Error, "repo_url is nil" if repo_url.nil?

      Base64.urlsafe_encode64(repo_url)
    end
  end
end
