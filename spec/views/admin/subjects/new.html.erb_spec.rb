require "rails_helper"

describe "admin/subjects/new.html.erb" do
  let!(:user) {create :user}
  let!(:subject) {create :subject}

  before do
    sign_in user
    assign :subject, subject
    render
  end

  it do
    expect(controller.request.path_parameters[:controller]).to eq "admin/subjects"
    expect(controller.request.path_parameters[:action]).to eq "new"
  end

  it do
    expect(rendered).to have_selector "form" do |form|
      form.is_epected.to have_selector "input", type: "text"
      form.is_epected.to have_selector "input", type: "submit"
    end
  end
end
