require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fts49
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.time_zone = "Asia/Bangkok"
    config.active_record.default_timezone = "Asia/Bangkok"
    config.active_job.queue_adapter = :delayed_job
    config.generators do |g|
      g.fixture_replacement :factory_girl
    end
  end
end
