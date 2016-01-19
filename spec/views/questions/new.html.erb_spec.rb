require "rails_helper"
require "rspec/active_model/mocks"

describe "questions/new.html.erb" do
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
    expect(controller.request.path_parameters[:action]).to eq "new"
  end

  it do
    expect(rendered).to have_selector "form" do |form|
      form.is_epected.to have_selector "select", name: "subject_id"
      form.is_epected.to have_selector "textarea", name: "content"
      form.is_epected.to have_selector "select", name: "question_type"
      form.is_epected.to have_selector "input", type: "submit"
    end
  end
end
