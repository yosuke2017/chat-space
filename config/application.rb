require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    config.i18n.default_locale = :ja
    config.active_record.default_timezone = :local
    config.time_zone = 'Tokyo'
    config.generators do |g|
        g.helper false
        g.assets false
        g.test_framework false
    end
  end
end

