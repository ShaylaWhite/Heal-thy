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
       erb :signup
    end

    #persits user here with name,email,pw
    get '/users' do
        if params[:name] !==

            @user = User.create{params}

            redirect "users/#{@user.id}"
            erb :'/users/show'
        else
         
    end 
end 
    
    get '/users/:id' do
        erb :'/users/show'
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
