class AddUtpAndTeacherToRequest2 < ActiveRecord::Migration[5.1]
  def change
  	add_reference :requests, :utp_role, index: true   # foreign_key: true <= remove this!
    add_reference :requests, :teacher_role, index: true  # foreign_key: true <= remove this!

    add_foreign_key :requests, :users, column: :utp_role_id
    add_foreign_key :requests, :users, column: :teacher_role_id
  end
end
