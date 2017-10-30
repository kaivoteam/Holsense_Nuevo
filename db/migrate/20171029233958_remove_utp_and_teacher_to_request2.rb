class RemoveUtpAndTeacherToRequest2 < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :requests, :teacher_role, index: true, foreign_key: true
  	remove_reference :requests, :utp_role, index: true, foreign_key: true
  end
end
