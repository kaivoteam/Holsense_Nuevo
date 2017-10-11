class RemoveOldJoinTable < ActiveRecord::Migration[5.1]
  def change
  	drop_join_table :images, :sections 
  end
end
