require "simplecov_badger/version"
require "simplecov_badger/formatter"
require "simplecov_badger/configuration"
require "base64"
require "rest-client"
require "simplecov_badger/railtie" if defined?(Rails)

module SimpleCov
  module Badger
    class Error < StandardError; end

    def self.configure
      yield configuration
    end

    def self.configuration
      @configuration ||= Configuration.new
    end
  end
end
