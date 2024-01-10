require "test_helper"
require "rails_env_helper"

class RailsEnvHelperTest < Minitest::Test
  def test_get_env_in_production
    Rails.stubs(:env).returns("production")
    ENV["MY_VARIABLE"] = "production_value"

    result = RailsEnvHelper.get_env("MY_VARIABLE")

    assert_equal "production_value", result
  end

  def test_get_env_in_non_production
    Rails.stubs(:env).returns("development")
    Rails.application.credentials.stubs(:[]).with("MY_VARIABLE").returns("development_value")

    result = RailsEnvHelper.get_env("MY_VARIABLE")

    assert_equal "development_value", result
  end
end