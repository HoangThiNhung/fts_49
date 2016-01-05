FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    admin true
    password "12345678"
    password_confirmation "12345678"
  end
end
