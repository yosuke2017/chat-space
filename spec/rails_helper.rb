require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

require 'devise'
require File.expand_path("spec/support/controller_macros.rb")


RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.include FactoryGirl::Syntax::Methods


  config.include Devise::Test::ControllerHelpers


  config.include ControllerMacros, type: :controller

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
