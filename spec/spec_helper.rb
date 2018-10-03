require "bundler/setup"
require "reedsy_interview_models"

require 'pry'

Dir[Dir.pwd + '/spec/fixtures/*.rb'].each { |file| require(file) }
Dir[Dir.pwd + '/spec/support/*.rb'].each { |file| require(file) }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
