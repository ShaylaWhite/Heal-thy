#Seed Data 

shayla = User.create(name:"Shayla" , email:"ShayladWhite1@gmail.com" , password:"red")

shaylaw = User.create(name:"Shaylaw" , email:"ShayladWhite11@gmail.com" , password:"red")

Weight.create(weight:"175" , food_intake:"apples and oranges" , user_id: "shayla")

Weight.create(weight:"175" , food_intake:"apples and oranges" , user_id: "shaylaw")