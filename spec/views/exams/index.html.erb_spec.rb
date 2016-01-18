require "rails_helper"

describe "exams/index.html.erb" do
  let!(:user) {create :user}
  let!(:subject) {create :subject}
  let!(:exam) {create :exam, subject: subject, user: user}
  let!(:exams) {user.exams.page(1)}

  before do
    sign_in user
    assign :subjects, Subject.all
    assign :exam, Exam.new
    assign :exams, exams
    render
  end

  it do
    expect(controller.request.path_parameters[:controller]).to eq "exams"
    expect(controller.request.path_parameters[:action]).to eq "index"
  end

  it do
    expect(rendered).to have_content exam.id
    expect(rendered).to have_content exam.created_at
    expect(rendered).to have_content exam.user_id
    expect(rendered).to have_content exam.subject_id
    expect(rendered).to have_content exam.duration
    expect(rendered).to have_content exam.number_question
    expect(rendered).to have_content exam.status
  end

  it do
    expect(rendered).to have_selector "form" do |form|
      form.is_epected.to have_selector "select", name: "subject_id"
      form.is_epected.to have_selector "input", name: "duration"
      form.is_epected.to have_selector "input", name: "status"
      form.is_epected.to have_selector "input", type: "submit"
    end
  end
end