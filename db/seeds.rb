# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create Default Admin
user1 = User.create! :email => 'admin@boyscoutsfd.com', :password => 'secret',
                     :first_name => "AdminFirstName01", :last_name => "AdminLastName01" unless User.find_by_email('admin@boyscoutsfd.com')

#Create Group Roles
admin_role = Role.create! :role=> "SiteAdmin" unless Role.find_by_role("SiteAdmin")
troop_leader_role = Role.create! :role=> "TroopLeader" unless Role.find_by_role("TroopLeader")
troop_member_role = Role.create! :role=> "TroopMember" unless Role.find_by_role("TroopMembers")

#Create a group to function as a Troop and set the admin to the created default admin
groupAdmin = Group.create! :name => "SiteAdmins", :admin => true unless Group.find_by_name("SiteAdmins")
groupAdmin.roles << admin_role unless groupAdmin.blank?

