module DeploymentWebhook
  GEM_ROOT = File.dirname(File.dirname(__FILE__))
  LIB_BASE = File.join(GEM_ROOT, 'lib/deployment_webhook')
  TASKS_BASE = File.join(GEM_ROOT, 'lib/capistrano/tasks')

  Dir[File.join(LIB_BASE, '*.rb')].each { |file| require(file) }
  Dir[File.join(TASKS_BASE, '*.rake')].each { |file| load(file) }

  def self.send_notification(deployment_webhook_url)
    Notifier.new(deployment_webhook_url).send_message
  end
end