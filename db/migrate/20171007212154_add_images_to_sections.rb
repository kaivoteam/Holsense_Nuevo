class AddImagesToSections < ActiveRecord::Migration[5.1]
  def change
  	  add_reference :images, :section, foreign_key: true
  	  add_reference :sections, :image, foreign_key: true
  end
end
