class RemoveBadRefferences < ActiveRecord::Migration[5.1]
  def change
  	  remove_reference :images, :section, foreign_key: true
  	  remove_reference :sections, :image, foreign_key: true
  end
end
