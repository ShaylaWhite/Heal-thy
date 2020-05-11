require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secert, "secert"
  end

  get "/" do
   if logged_in?
      redirect "/users/#{current_user.id}"
   else
      erb :welcome
  end
end 
end
