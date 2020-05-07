class UsersController < ApplicationController 


    get '/login' do
        erb :login
    end

   
    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            #flash[:success] = "#{@user.email}, Successfully Logged In"
            redirect "users/#{@user.id}" 
        else
            #flash.now[:danger] = "Incorrect User/Password"
            redirect '/login'
        end
    end
        
    get '/signup' do
        "please sign up"
    end

    get '/users/:id' do
        "show route"
    end 

    helpers do

        def logged_in?
        !!current_user
        end 

        def current_user
         @current_user ||= User.find_by(id: session[:user_id])
        end 

    end 
end 
