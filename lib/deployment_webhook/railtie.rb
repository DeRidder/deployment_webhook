class RakeGem::Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/deployment_webhook_tasks.rake'
  end
end
