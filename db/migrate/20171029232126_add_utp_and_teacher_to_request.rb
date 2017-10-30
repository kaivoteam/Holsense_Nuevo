class AddUtpAndTeacherToRequest < ActiveRecord::Migration[5.1]
  def change
  	add_reference :requests, :utp_role, index: true, foreign_key: true
    add_reference :requests, :techer_role, index: true, foreign_key: true
  end
end
