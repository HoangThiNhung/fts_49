FactoryGirl.define do
  factory :question do
    content {Faker::Name.name}
    status :accepted
    question_type :single_choice
    user {FactoryGirl.create :user}
    subject {FactoryGirl.create :subject}
    factory :invalid_attributes do
      content nil
    end
    factory :waiting do
      status :waitting
    end
  end
end
