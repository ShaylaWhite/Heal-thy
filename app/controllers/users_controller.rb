class UsersController < ApplicationController 

    #shows login page /login from| 

    get '/login' do
        erb :login
    end

    #post the user login information 
    #create a sessin log user in and after user is found 
    post '/login' do 
        @user = User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect "/"
        else
          erb :'/login.html'
        end
    end
 



    get '/signup' do
    end

end 