require 'rails_helper'
require 'net/https'

module DeploymentWebhook
  RSpec.describe Notifier, type: :model do
    subject(:notifier) do
      described_class.new(
        deployment_webhook_url: 'http://example.com/webhooks/deployment',
        application: 'random_application',
        stage: 'production'
      )
    end

    describe '#send_message' do
      before do
        allow(notifier).to receive(:deployer).and_return('DeRidder')
      end

      it 'posts a HTTP request with the correct content' do
        stub_request(:post, "http://example.com/webhooks/deployment").
        with(
          body: {
            application: 'random_application',
            user: 'DeRidder',
            stage: 'production'
          }.to_json,
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type' => 'application/json',
            'User-Agent' => 'Ruby'
          }
        )

        notifier.send_message
      end
    end
  end
end
