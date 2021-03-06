module SimpleCov::Badger
  class Formatter
    attr_reader :config

    def initialize(output = nil)
      @output = output || STDOUT
      @config = SimpleCov::Badger.configuration
    end

    def format(result)
      if config.run_if.call
        RestClient.patch(
          config.badge_url,
          { percentage: result.source_files.covered_percent.round(2), token: config.token }
        )

        puts "SimpleCov::Badger: Your badge can be found at: #{config.badge_url}"
      end
    end
  end
end
