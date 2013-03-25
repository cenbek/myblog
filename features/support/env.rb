ENV['RAILS_ENV'] = 'test'
require './config/environment'

require 'minitest/spec'
require 'database_cleaner'

DatabaseCleaner[:mongoid].strategy = :truncation
Spinach.hooks.before_scenario{ DatabaseCleaner.clean }

Spinach.config.save_and_open_page_on_failure = true

common_steps = Dir.glob(Rails.root.join("features/steps/common_steps/**/*.rb"))

common_steps.each do |f|
  require f
end

class Spinach::FeatureSteps
  include Rails.application.routes.url_helpers
end
