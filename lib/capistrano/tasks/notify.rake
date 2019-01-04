require 'rake'

namespace :deploy do
  desc 'Send a deployment notification for a given application and environment'
  task :notify do
    DeploymentWebhook::Notifier.new(
      deployment_webhook_url: fetch(:deployment_webhook_url),
      application: fetch(:application),
      stage: fetch(:stage)
    ).send_message
  end
end
