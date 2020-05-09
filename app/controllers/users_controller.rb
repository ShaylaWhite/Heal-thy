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
            #flash.now[:danger] = "Incorrect User/Password. Please login again!"
            redirect '/login'
        end
    end
        
    get '/signup' do
       erb :signup
    end

    #persits user here with name,email,pw
    post '/users' do
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
        @user.name = params[:name]
    
        if @user.save
         #flash.now[:success] = "You are now Signed Up, Please login!
          redirect '/login'
        else
             #flash.now[:danger] = "Sorry Something Went Wrong Sign Up Again"
            erb :signup
        end
      end
    
    get '/users/:id' do
        @user = User.find_by(id:params[:id])
        erb :'/users/show'
    end 

    get '/logout' do
        session.clear
        redirect '/'
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
