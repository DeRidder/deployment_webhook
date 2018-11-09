namespace :deploy do
  desc 'Send a deployment notification for a given environment and application'
  task :notify do
    DeploymentWebhook::Notifier.new(
      deployment_url: ENV['DEPLOYMENT_WEBHOOK_URL'],
      application: fetch(:application),
      stage: fetch(:stage)
    ).send_message
  end
end
