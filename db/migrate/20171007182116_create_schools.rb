class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :direction
      t.text :description
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
