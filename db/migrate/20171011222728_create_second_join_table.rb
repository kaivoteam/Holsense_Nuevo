class CreateSecondJoinTable < ActiveRecord::Migration[5.1]
  def change
  	create_join_table :images, :sections do |t|
	     t.index [:image_id, :section_id]
	      t.index [:section_id, :image_id]
	 end
  end
end
