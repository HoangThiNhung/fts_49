require "rails_helper"
describe QuestionsController do
  let!(:user){FactoryGirl.create :user}
  let!(:subject){FactoryGirl.create :subject}
  let!(:question){FactoryGirl.create :waiting, user: user, subject: subject}
  let!(:option){FactoryGirl.create :option, question: question}
  before{sign_in user}

  describe "GET index" do
    before{get :index}
    it{expect(response).to be_success}
    it{expect(response).to have_http_status 200}
    it{expect(response).to render_template :index}
  end

  describe "GET show" do
    before{get :show, id: question}
    it{expect(response).to be_success}
    it{expect(response).to have_http_status 200}
    it{expect(response).to render_template :show}
  end

  describe "POST create" do
    context "valid attributes" do
      before do
        post :create,
        question: FactoryGirl.attributes_for(:waiting, user: user,
          subject: subject, question_type: :single_choice)
      end
      it{expect(response).to redirect_to questions_path}
      it{expect(flash[:success]).to be_present}
      it{expect(user.questions.count).to eq 2}
    end
  end

  describe "PATCH update" do
    context "valid attributes" do
      before do
        patch :update, id: question.id,
        question: FactoryGirl.attributes_for(:waiting,
          question_type: :multiple_choice)
      end
      it{expect(response).to redirect_to question}
    end
  end

  describe "DELETE destroy" do
    before{delete :destroy, id: question.id}
    it{expect(response).to redirect_to questions_path}
    it{expect(flash[:success]).not_to be_nil}
  end
end
