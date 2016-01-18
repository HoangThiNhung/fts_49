require "rails_helper"

describe "exams/show.html.erb" do
  let!(:user) {create :user}
  let!(:subject) {create :subject}
  let!(:exam_finished) {create :exam, subject: subject, user: user}
  let!(:exam_testing) {create :exam, subject: subject,
    user: user, status: :testing}

  before do
    sign_in user
  end

  it do
    expect(controller.request.path_parameters[:controller]).to eq "exams"
    expect(controller.request.path_parameters[:action]).to eq "show"
  end

  describe "exam is testing" do
    before do
      assign :exam, exam_testing
      render
    end

    it "renders the show template" do
      expect(response).to render_template("exams/show")
    end

    it do
      expect(rendered).to have_selector "form" do |form|
        form.is_epected.to have_selector "input", value: "Save"
        form.is_epected.to have_selector "input", value: "Finish"
      end
    end

  end
end