load File.expand_path('../deployment_webhook/notifier.rb', __FILE__)

module DeploymentWebhook
  def self.send_notification(deployment_webhook_url)
    Notifier.new(deployment_webhook_url).send_message
  end
end
