require "rails_helper"

RSpec.describe Exam, type: :model do
  let(:exam) {FactoryGirl.build :exam}

  subject {exam}

  it {should respond_to :user_id}
  it {should respond_to :subject_id}
  it {should respond_to :status}
end
