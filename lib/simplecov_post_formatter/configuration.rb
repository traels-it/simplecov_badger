module SimplecovPostFormatter
  class Configuration
    def self.options
      {
        post_url: nil,
        repo_url: nil
      }
    end

    options.keys.each do |opt|
      define_method(opt) { instance_variable_get "@#{opt}" }
      define_method("#{opt}=") { |val| instance_variable_set("@#{opt}", val) }
    end

    def initialize(**opts)
      SimplecovPostFormatter::Configuration.options.merge(opts).each { |opt, v| send(:"#{opt}=", v) }
    end

    def encoded_repo_url
      raise SimplecovPostFormatter::Error, "repo_url is nil" if repo_url.nil?

      Base64.urlsafe_encode64(repo_url)
    end
  end
end
