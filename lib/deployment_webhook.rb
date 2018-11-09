require "deployment_webhook/version"
require "deployment_webhook/railtie" if defined?(Rails)

module DeploymentWebhook
  GEM_ROOT = File.dirname(File.dirname(__FILE__))
  LIB_BASE = File.join(GEM_ROOT, 'lib', 'deployment_webhook')
  TASK_BASE = File.join(GEM_ROOT, 'lib', 'tasks')

  Dir[File.join(LIB_BASE, '*.rb')].each { |file| require(file) }
  Dir[File.join(TASK_BASE, '*.rb')].each { |file| require(file) }

  def self.send_notification(deployment_webhook_url)
    Notifier.new(deployment_webhook_url).send_message
  end
end
