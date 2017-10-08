class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.text :comment
      t.string :status
      t.string :mail_requester

      t.timestamps
    end
  end
end
