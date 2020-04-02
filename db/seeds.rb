# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.delete_all
Role.create([{title: 'super_admin'}, {title: 'approver'},
               {title:'employee'}, {title: 'admin'}])
puts "Roles Created"

Permission.delete_all
Permission.create([{permission: 'can_edit'}, {permission: 'can_create'},
               {permission:'can_delete'}, {permission: 'can_approve'}])
puts "Permissions Created"