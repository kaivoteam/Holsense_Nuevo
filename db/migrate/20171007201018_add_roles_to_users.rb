class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :superadmin_role, :boolean, default: false
    add_column :users, :utp_role, :boolean, default: false
    add_column :users, :teacher_role, :boolean, default: true
    remove_column :users, :type
  end
end
