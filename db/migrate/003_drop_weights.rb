class DropWeights  < ActiveRecord::Migration

    def change
        drop_table :weights
    end

end