module SimplecovBadger
  class Formatter
    attr_reader :config

    def initialize(output = nil)
      @output = output || STDOUT
      @config = SimplecovBadger.configuration
    end

    def format(result)
      RestClient.post(
        config.post_url,
        { percentage: result.source_files.covered_percent.round(2), repo_url: config.encoded_repo_url }
      )
    end
  end
end
