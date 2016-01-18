FactoryGirl.define do
  factory :subject do
    name {Faker::Name.name}
    factory :invalid_subject do
      name ""
    end
  end
end
