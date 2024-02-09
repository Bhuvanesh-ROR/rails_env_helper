# frozen_string_literal: true

require_relative "rails_env_helper/version"

module RailsEnvHelper
  class << self
    def initialize_env_variables(config_file_path)
      begin
        env_vars = load_env_variables(config_file_path)
        set_env_variables(env_vars)
        return "Environment variables initialized successfully."
      rescue Errno::ENOENT
        return "Error: Configuration file not found at #{config_file_path}."
      rescue Psych::SyntaxError
        return "Error: Invalid YAML syntax in the configuration file."
      rescue StandardError => e
        return "Error: #{e.message}"
      end
    end

    def get_env(variable_name)
      if Rails.env.production?
        ENV[variable_name]
      else
        Rails.application.credentials[variable_name]
      end
    end

    private

    def load_env_variables(config_file_path)
      env_vars_file = Rails.root.join(config_file_path)
      YAML.load_file(env_vars_file)
    end

    def set_env_variables(env_vars)
      Rails.application.configure do
        env_vars[Rails.env].each do |key, value|
          ENV[key] ||= value.to_s
        end
      end
    end
  end
end
