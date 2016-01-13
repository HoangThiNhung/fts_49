require "rails_helper"
describe ExamsController do
  let!(:user){FactoryGirl.create :user}
  let!(:subject){FactoryGirl.create :subject}
  let!(:question){FactoryGirl.create :question, user: user, subject: subject}
  let!(:option){FactoryGirl.create :option, question: question}
  let!(:exam){FactoryGirl.create :exam, subject: subject, user: user}
  before{sign_in user}

  describe "GET index" do
    before{get :index}
    it{expect(response).to be_success}
    it{expect(response).to have_http_status 200}
    it{expect(response).to render_template :index}
  end

  describe "GET show" do
    before{get :show, id: exam}
    it{expect(response).to be_success}
    it{expect(response).to have_http_status 200}
    it{expect(response).to render_template :show}
  end

  describe "POST create" do
    context "valid attributes" do
      before do
        post :create, exam: FactoryGirl.attributes_for(:exam,
          subject_id: subject.id, status: :start)
      end
      it{expect(response).to redirect_to exams_path}
      it{expect(flash[:success]).to be_present}
      it{expect(user.exams.count).to eq 2}
    end
  end

  describe "PATCH update" do
    context "valid attributes" do
      before do
        patch :update, id: exam.id, commit: "Finish",
        exam: FactoryGirl.attributes_for(:exam)
      end
      it{expect(flash[:success]).to be_present}
    end
  end
end
