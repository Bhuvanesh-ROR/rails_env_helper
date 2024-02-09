RailsEnvHelper Gem Documentation
RailsEnvHelper is a Ruby gem designed to simplify handling environment variables in Rails applications. It provides methods to load environment variables from a YAML configuration file and access them based on the current Rails environment.

Installation
To install RailsEnvHelper, add it to your Gemfile:

ruby,
```ruby
gem 'rails_env_helper'
```
Then, run the following command to install the gem:

base,
```ruby
bundle install
```
Usage
Initializing Environment Variables
RailsEnvHelper provides a method to initialize environment variables from a YAML configuration file. Call the initialize_env_variables method and provide the path to your YAML file:

ruby,
```ruby
RailsEnvHelper.initialize_env_variables('config/env_variables.yaml')
```
Accessing Environment Variables
You can access environment variables using the get_env method:

ruby
```ruby
value = RailsEnvHelper.get_env('variable_name')
```
Example YAML Configuration
Here's an example YAML configuration file (config/env_variables.yaml):

yaml
Copy code
development:
variable_name: value_for_development

test:
variable_name: value_for_test

production:
variable_name: value_for_production
Error Handling
RailsEnvHelper handles various error scenarios gracefully, such as missing configuration files or invalid YAML syntax.

Running Tests
To run the test suite, ensure you have RSpec installed. Then, execute the following command:

bash
```ruby
bundle exec rspec
```
Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/Bhuvanesh-ROR/rails_env_helper.

License
The gem is available as open source under the terms of the MIT License.
