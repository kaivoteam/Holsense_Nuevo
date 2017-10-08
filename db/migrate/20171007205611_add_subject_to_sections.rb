class AddSubjectToSections < ActiveRecord::Migration[5.1]
  def change
  	add_reference :sections, :subject, foreign_key: true
  end
end
