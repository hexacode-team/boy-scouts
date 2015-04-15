# spec/factories.rb
#FactoryGirl.define :user do |user|
#	user.email			"test@example.com"
#	user.password		"password"
#	user.admin			true
#end

FactoryGirl.define do
    factory :user do
            email		"test@example.com"
            password	"password"
        end
    factory :admin do
        admin true
    end
end

#factory :user do
 # email "test@example.com"
  #password "password"
#
 # factory :admin do
  #  admin true
  #end
#end
