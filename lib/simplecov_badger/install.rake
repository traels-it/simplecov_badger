desc "Create the initial badge and save an authentication token in a file"
namespace :simplecov_badger do
  task install: :environment do
    require "simplecov_badger"
    require "json"

    config = SimpleCov::Badger.configuration

    begin
      response = RestClient.post(
        config.post_url,
        { repo_url: config.encoded_repo_url }
      )
      File.write("#{project_root}/.simplecov_badger_auth_token", JSON.parse(response.body)["token"])
    rescue => exception
      puts exception.response
      puts exception.response.body
    end
  end

  def project_root
    if defined?(Rails)
      return Rails.root
    end

    if defined?(Bundler)
      return Bundler.root
    end

    Dir.pwd
  end
end
