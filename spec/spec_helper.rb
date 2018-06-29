require "bundler/setup"
require 'active_record'
require "active_record_validations_inflector"
require 'active_record'
require 'yaml'

TEST_DIR = File.dirname(__FILE__)

ActiveRecord::Base.configurations = YAML::load(ERB.new(IO.read(TEST_DIR + "/db/database.yml")).result)
ActiveRecord::Base.establish_connection((ENV["DB"] ||= "sqlite3mem").to_sym)
ActiveRecord::Migration.verbose = false

require 'combustion/database'
Combustion::Database.create_database(ActiveRecord::Base.configurations[ENV["DB"]])
load(File.join(TEST_DIR, "db", "schema.rb"))

require 'support/custom_validators'
require 'support/models'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after(:suite) do
    unless /sqlite/ === ENV['DB']
      Combustion::Database.drop_database(ActiveRecord::Base.configurations[ENV['DB']])
    end
  end
end
