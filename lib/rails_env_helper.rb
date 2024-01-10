# frozen_string_literal: true

require_relative "rails_env_helper/version"

module RailsEnvHelper
  def self.get_env(variable_name)
    Rails.env.production? ? ENV[variable_name] : Rails.application.credentials[variable_name]
  end
end
