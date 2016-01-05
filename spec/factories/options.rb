FactoryGirl.define do
  factory :option do
    content {Faker::Name.name}
    is_correct false
    association :question, method: :build
  end
end
