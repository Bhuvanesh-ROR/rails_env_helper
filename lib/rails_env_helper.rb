# frozen_string_literal: true

require_relative "rails_env_helper/version"

module RailsEnvHelper
  def self.get_env(variable_name)
    if Rails.env.production?
      ENV[variable_name]
    else
      Rails.application.credentials[variable_name]
    end
  end
end
