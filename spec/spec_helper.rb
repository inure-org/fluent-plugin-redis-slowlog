require "rspec"
require "pry"

require "fluent/test"
require "fluent/test/driver/input"
require "fluent/test/helpers"

Dir.glob(File.expand_path("../lib/**/*.rb", __dir__)).each(&method(:require))

# Test::Unit é necessário para fluent/test
# porém, não auto-inicializar isso
Test::Unit::AutoRunner.need_auto_run = false

RSpec.configure do |config|
    config.include Fluent::Test::Helpers
end
