require "rails_helper"

RSpec.describe Question, type: :model do
  let(:question) {FactoryGirl.build :question}
  subject {question}

  it {should respond_to :content}
  it {should respond_to :status}
  it {should respond_to :question_type}
  it {should respond_to :subject_id}
  it {should respond_to :user_id}

  it {should be_valid}

  describe "when content is not present" do
    before {question.content = " "}
    it {should_not be_valid}
  end

  describe "association" do
    it {should have_many :options}
    it {should belong_to :subject}
  end

end
