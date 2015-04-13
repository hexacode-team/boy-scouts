# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create Default Admin
user1 = User.create! :email => 'admin@boyscoutsfd.com', :password => 'secret',  :admin => true unless User.find_by_email('admin@boyscoutsfd.com')

#Create a regular user
user2 = User.create! :email => 'user01@boyscoutsfd.com', :password => 'secret',  :can_vew_routes => true unless User.find_by_email('user01@boyscoutsfd.com')

#Create a group to function as a Troop and set the admin to the created default admin.
group1 = Group.create! :name => "Troop01", :user_id => user1.id unless Group.find_by_name('Troop01')
group2 = Group.create! :name => "Troop02", :user_id => user1.id unless Group.find_by_name('Troop02')

#Create new routes and add new subscriptions to that routes
route1 = Route.create! :name => "Route01", :group_id => group1.id unless Route.find_by_name("Route01")
route2 = Route.create! :name => "Route02", :group_id => group1.id unless Route.find_by_name("Route02")

sub1 = Subscription.create! :first_name => "FirstName01", :last_name => "LastName01", :route_id => route1.id, :address_line_1 => "1234 Fake Street",
                            :city => "Fake City", :zip => "00001", :state => "Fake Station", :qty => 1, :user_id => user2 unless Subscription.find_by_first_name("FirstName01")
sub2 = Subscription.create! :first_name => "FirstName02", :last_name => "LastName02", :route_id => route1.id, :address_line_1 => "1235 Fake Street",
                            :city => "Fake City", :zip => "00002", :state => "Fake Station", :qty => 2, :user_id => user2 unless Subscription.find_by_first_name("FirstName02")
sub3 = Subscription.create! :first_name => "FirstName03", :last_name => "LastName03", :route_id => route1.id, :address_line_1 => "1236 Fake Street",
                            :city => "Fake City", :zip => "00006", :state => "Fake Station", :qty => 3, :user_id => user2 unless Subscription.find_by_first_name("FirstName03")

#create a current payment for sub 1, and an old payment for sub2
pay1 = Payment.create! :subscription_id => sub1.id, :amount_paid => sub1.qty * 30, :date => DateTime.now unless Payment.find_by_subscription_id(sub1.id)
pay2 = Payment.create! :subscription_id => sub2.id, :amount_paid => sub2.qty * 30, :date => (DateTime.now - 366) unless Payment.find_by_subscription_id(sub2.id)


