require "rails_helper"

RSpec.describe Subject, type: :model do
  before {@subject = FactoryGirl.build :subject}

  subject {@subject}
  it {should respond_to :name}

  it {should be_valid}

  describe "when name is not present" do
    before {@subject.name = " "}
    it {should_not be_valid}
  end

  describe "when name has length more than 50" do
    before {@subject.name = "a"*51}
    it {should_not be_valid}
  end

  describe "when name has length less than 50" do
    before {@subject.name = "a"*50}
    it {should be_valid}
  end

  describe "association" do
    it {should have_many :exams}
    it {should have_many :questions}
  end
end
