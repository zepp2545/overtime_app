FactoryBot.define do
   sequence :email do |n|
     "test#{n}@example.com"
   end

   factory :user do
       email { generate :email }
       password { 'km25458565' }
       password_confirmation { 'km25458565' }
       first_name { 'Konan' }
       last_name { 'Maruyama' }
   end

   factory :admin_user, class: 'AdminUser' do
    email { generate :email }
    password { 'k25458565' }
    password_confirmation { 'k25458565' }
    first_name { 'Admin' }
    last_name { 'Maruyama' }
   end
end

