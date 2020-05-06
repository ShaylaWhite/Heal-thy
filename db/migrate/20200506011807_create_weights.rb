class CreateWeights < ActiveRecord::Migration
  def change 
    create_table :weights do |t| 
      t.integer :weight
      t.string  :food_intake
      t.integer :user_id
    end 
  end
end
