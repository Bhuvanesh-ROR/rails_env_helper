# frozen_string_literal: true

require 'rails_env_helper'

RSpec.describe RailsEnvHelper do
  it "has a version number" do
    expect(RailsEnvHelper::VERSION).not_to be nil
  end

  describe '.initialize_env_variables' do
    context 'when the config file exists' do
      it 'loads and sets environment variables' do
        expect { RailsEnvHelper.initialize_env_variables('config/env_variables.yaml') }.not_to raise_error
      end

      it 'returns a success message' do
        expect(RailsEnvHelper.initialize_env_variables('config/env_variables.yaml')).to eq('Environment variables initialized successfully.')
      end
    end

    context 'when the config file does not exist' do
      it 'raises an error' do
        expect { RailsEnvHelper.initialize_env_variables('config/non_existing_file.yaml') }.to raise_error(RuntimeError, /Configuration file not found/)
      end
    end

    context 'when the config file has invalid YAML syntax' do
      it 'raises an error' do
        expect { RailsEnvHelper.initialize_env_variables('spec/fixtures/invalid_yaml.yaml') }.to raise_error(RuntimeError, /Invalid YAML syntax/)
      end
    end
  end

  describe '.get_env' do
    context 'in production environment' do
      before { allow(Rails.env).to receive(:production?).and_return(true) }

      it 'returns environment variable from ENV' do
        ENV['test_var'] = 'test_value'
        expect(RailsEnvHelper.get_env('test_var')).to eq('test_value')
      end
    end

    context 'in non-production environment' do
      before { allow(Rails.env).to receive(:production?).and_return(false) }

      it 'returns environment variable from Rails credentials' do
        allow(Rails.application.credentials).to receive(:[]).with('test_var').and_return('test_value')
        expect(RailsEnvHelper.get_env('test_var')).to eq('test_value')
      end
    end
  end

  describe '.initialize_env_variables' do
    context 'when the config file is empty' do
      it 'raises an error' do
        expect { RailsEnvHelper.initialize_env_variables('spec/fixtures/empty_yaml.yaml') }.to raise_error(RuntimeError, /Configuration file is empty/)
      end
    end
  end

  describe '.get_env' do
    context 'when the variable is not found in production' do
      before { allow(Rails.env).to receive(:production?).and_return(true) }

      it 'returns nil' do
        expect(RailsEnvHelper.get_env('non_existing_var')).to be_nil
      end
    end

    context 'when the variable is not found in development' do
      before { allow(Rails.env).to receive(:production?).and_return(false) }

      it 'returns nil' do
        expect(RailsEnvHelper.get_env('non_existing_var')).to be_nil
      end
    end
  end
end
