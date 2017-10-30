class RemoveUtpAndTeacherToRequest < ActiveRecord::Migration[5.1]
  def change
    remove_reference :requests, :techer_role, index: true, foreign_key: true
  end
end
