module DeploymentWebhook
  class Notifier
    attr_reader :application, :stage

    def initialize(application:, stage:)
      @application = application
      @stage = stage
    end

    def send_message
      require 'uri'
      require 'net/https'
      require 'json'

      header = { 'Content-Type': 'application/json' }
      uri = URI.parse(ENV['DEPLOYMENT_WEBHOOK_URL'])
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri, header)

      request.body = {
        application: application,
        user: deployer,
        stage: stage
      }.to_json

      http.request(request)
    rescue => e
      # Do nothing
    end

    private

    def deployer
      name = `git config user.name`.strip
      name = nil if name.empty?
      name ||= Etc.getpwnam(ENV['USER']).gecos || ENV['USER'] || ENV['USERNAME']
      name
    end
  end
end
