require 'bundler/setup'
Bundler.require

ENV["APP_ENV"] ||= 'staging'

case ENV["APP_ENV"]
when "production"
  Envyable.load('./config/.env.yml', 'production')
when "staging"
  Envyable.load('./config/.env.yml', 'staging')
when "test"
  Envyable.load('./config/.env.yml', 'test')
when "development"
  Envyable.load('./config.env.yml', 'development')
end

ActiveRecord::Base.establish_connection(
  adapter: "mysql2",
  database: ENV["DB_NAME"],
  username: "root",
  password: ENV["DB_PASSWORD"],
  host: ENV["DB_HOST"]
)

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/tasks", "*.rb")].each {|f| require f}
