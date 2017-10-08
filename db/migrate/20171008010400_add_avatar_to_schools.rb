class AddAvatarToSchools < ActiveRecord::Migration[5.1]
  def self.up
    change_table :schools do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :schools, :avatar
  end
end
