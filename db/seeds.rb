# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! do |u|
    u.email = 'contactokaivo@gmail.com'
    u.nickname = 'gestorholsense'
    u.password    = 'kaivoteam'
    u.password_confirmation = 'kaivoteam'
	u.superadmin_role = true
    u.school_id = 1
end

School.create! do |s|
	s.name     = 'Colegio El Carmen Teresiano'
    s.phone = 224068550
    s.email    = 'secretaria@carmenteresiano-lareina.cl'
 end