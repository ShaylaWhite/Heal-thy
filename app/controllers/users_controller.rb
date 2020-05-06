class UsersController < ApplicationController 

    #shows login page /login from| 

    get '/login' do
        erb :login
    end

    #post the user login information 
    #create a sessin log user in and after user is found 
    post '/login' do 
       
    end
 



    get '/signup' do
    end

end 