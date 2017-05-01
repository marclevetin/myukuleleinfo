FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com"}
    first_name 'My'
    last_name 'Ukulele'
    password 'password'
  end
end
