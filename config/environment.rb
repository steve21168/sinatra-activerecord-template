require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "saas-template_development"
)

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}
