class CreateSecondsUsers < ActiveRecord::Migration[5.1]
  def change
    User.create! do |u|
    	u.email = 'contactokaivo@gmail.com'
        u.nickname = 'gestorholsense'
        u.password    = 'kaivoteam'
        u.password_confirmation = 'kaivoteam'
        u.superadmin_role = true
        u.school_id = 1
    end
  end
end
