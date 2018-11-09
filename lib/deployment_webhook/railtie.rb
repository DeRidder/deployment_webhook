module DeploymentWebhook
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/notify.rake'
    end
  end
end
