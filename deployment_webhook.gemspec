$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "deployment_webhook/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "deployment_webhook"
  s.version     = DeploymentWebhook::VERSION
  s.authors     = ["DeRidder"]
  s.email       = ["p.b.deridder@hotmail.com"]
  s.homepage    = "https://github.com/"
  s.summary     = "Webhook for sending deployment message"
  s.description = "Webhook for sending deployment message"
  s.license     = "MIT"
  s.require_paths = ["lib"]

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|features)/}) }

  s.add_dependency "rails"

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'webmock'
  s.add_dependency 'capistrano'
  s.add_dependency 'capistrano-rails'
end
