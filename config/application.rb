# frozen_string_literal: true

require_relative 'boot'
require_relative '../app/middleware/authorize_request'
require_relative '../app/middleware/bad_request_handler'

require 'rails'
require 'rails/all'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module EspressoRailsTest
  class Application < Rails::Application
    config.autoload_paths += Dir[Rails.root.join('app/services/**/')]
    config.autoload_paths += Dir[Rails.root.join('app/controllers/**/')]

    config.middleware.use BadRequestHandler
    config.middleware.insert_before 0, AuthorizeRequest

    config.load_defaults 5.2
    config.generators.system_tests = nil
  end
end
