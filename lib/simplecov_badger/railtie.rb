require "rails"
require "simplecov_badger"
require "pathname"

class SimpleCov::Badger::Railtie < Rails::Railtie
  railtie_name :simplecov_badger

  rake_tasks do
    load Pathname.new(__dir__).join("install.rake")
  end
end
