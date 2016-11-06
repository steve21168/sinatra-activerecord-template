class ApplicationController < Sinatra::Base
  get '/' do
    User.first.last_name
  end
end
