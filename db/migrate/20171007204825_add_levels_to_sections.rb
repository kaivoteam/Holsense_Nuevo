class AddLevelsToSections < ActiveRecord::Migration[5.1]
  def change
  	add_reference :sections, :level, foreign_key: true
  end
end
