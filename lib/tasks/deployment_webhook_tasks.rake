namespace :deploy do
  task :notify do
    DeploymentWebhook::Notifier.new(
      deployment_url: ENV['DEPLOYMENT_WEBHOOK_URL'],
      application: fetch(:application),
      stage: fetch(:stage)
    ).send_message
  end
end

after 'deploy', 'deploy:notify'
