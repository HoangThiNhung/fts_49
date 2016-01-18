require "rails_helper"
describe Admin::SubjectsController do
  let(:admin){FactoryGirl.create(:admin)}
  let(:subject){FactoryGirl.create(:subject)}
  before{sign_in admin}

  describe "GET index" do
    before{get :index}
    it{expect(response).to be_success}
    it{expect(response).to have_http_status 200}
    it{expect(response).to render_template :index}
  end

  describe "POST create" do
    context "valid attributes" do
      before{post :create, subject: FactoryGirl.attributes_for(:subject)}
      it{expect(response).to redirect_to admin_subjects_path}
      it{expect(flash[:success]).to be_present}
    end
    context "invalid attributes" do
      before{post :create, subject: FactoryGirl.attributes_for(:invalid_subject)}
      it{expect(response).to render_template :new}
      it{expect(flash[:danger]).to be_present}
    end
  end

  describe "PATCH update" do
    context "valid attributes" do
      before do
        patch :update, id: subject.id, subject: FactoryGirl.attributes_for(:subject,
          name: "Android")
      end
      it{expect(flash[:success]).to be_present}
      it{expect(response).to redirect_to admin_subjects_path}
    end
    context "invalid attributes" do
      before do
        patch :update, id: subject.id,
          subject: FactoryGirl.attributes_for(:invalid_subject)
      end
      it{expect(response).to render_template :edit}
      it{expect(flash[:danger]).to be_present}
    end
  end

  describe "DELETE destroy" do
    before{delete :destroy, id: subject.id}
    it{expect(response).to redirect_to admin_subjects_path}
    it{expect(flash[:success]).not_to be_nil}
  end
end
