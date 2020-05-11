class WeightsController < ApplicationController  
  get '/weights/new' do 
    erb :'/weights/new'
  end 

  post '/weights' do

    if 
        !logged_in?
        redirect'/'
    end 
    
   
    if params[:weight] && params[:food_intake] != ""

        @weight = Weight.new
        @weight.weight = params[:weight]
        @weight.food_intake = params[:food_intake]
        @weight.user_id = params[:user_id]
        @weight.user = current_user
       redirect "/weights/#{@weight.id}"
    else 
      # redirect '/weights/new'
    end
  end 


  
end 