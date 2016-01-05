FactoryGirl.define do
  factory :question do
    content {Faker::Name.name}
    status "accepted"
    question_type 1
    association :user, method: :build
    association :subject, method: :build
  end
end
