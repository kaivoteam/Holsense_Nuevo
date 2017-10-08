class AddSectionToRequests < ActiveRecord::Migration[5.1]
  def change
  	add_reference :requests, :section, foreign_key: true
  end
end
