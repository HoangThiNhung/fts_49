require "rails_helper"

describe "questions/new.html.erb" do
  let!(:user) {create :user}
  let!(:question) {create :question}
  let!(:subject) {create :subject}

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
