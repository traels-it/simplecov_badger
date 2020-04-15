require "simplecov_post_formatter/version"
require "simplecov_post_formatter/formatter"
require "simplecov_post_formatter/configuration"
require "base64"
require "rest-client"

module SimplecovPostFormatter
  class Error < StandardError; end

  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
