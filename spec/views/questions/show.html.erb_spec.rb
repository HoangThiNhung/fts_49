require "rails_helper"
require "rspec/active_model/mocks"

describe "questions/show.html.erb" do
  subject {rendered}
  let!(:user) {FactoryGirl.build :user}
  let!(:subject) {FactoryGirl.build :subject}
  let(:question) {mock_model(Question).as_new_record.as_null_object}

  before do
    sign_in user
    assign :question, question
    assign :subjects, [subject]
    render
  end

  it do
    expect(controller.request.path_parameters[:controller]).to eq "questions"
    expect(controller.request.path_parameters[:action]).to eq "show"
  end

  it do
    expect(rendered).to have_content question.content
    expect(rendered).to have_content question.subject.name
    expect(rendered).to have_content question.question_type
    expect(rendered).to have_content question.status
  end
end