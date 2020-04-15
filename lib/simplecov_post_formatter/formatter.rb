module SimplecovPostFormatter
  class Formatter
    attr_reader :config

    def initialize(output = nil)
      @output = output || STDOUT
      @config = SimplecovPostFormatter.configuration
    end

    def format(result)
    end
  end
end
