require "rails_helper"

describe "admin/subjects/index.html.erb" do
  let!(:user) {create :user}
  let!(:subject) {create :subject}
  let!(:subjects) {Subject.all.page(1)}
  before do
    sign_in user
    assign :subjects, subjects
    render
  end

  it do
    expect(controller.request.path_parameters[:controller]).to eq "admin/subjects"
    expect(controller.request.path_parameters[:action]).to eq "index"
  end

  it do
    expect(rendered).to have_content subject.name
  end
end
