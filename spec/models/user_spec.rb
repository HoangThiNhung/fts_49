require "rails_helper"
require "cancan/matchers"

RSpec.describe User, type: :model do
  before {@user = FactoryGirl.build :user}
  before {@user2 = FactoryGirl.build :user}

  subject {@user}
  it {should respond_to :name}
  it {should respond_to :email}
  it {should respond_to :password}
  it {should respond_to :password_confirmation}

  it {should be_valid}

  describe "when email is not present" do
    before {@user.email = " "}
    it {should_not be_valid}
  end

  describe "when name is not present" do
    before {@user.name = " "}
    it {should_not be_valid }
  end

  describe "when password is not present" do
    before {@user.password = " "}
    it {should_not be_valid}
  end

  describe "when password has length less than 6" do
    before {@user.password = "a"*5}
    it {should_not be_valid}
  end

  describe "when name has length more than 50" do
    before {@user.name = "a"*51}
    it {should_not be_valid}
  end

  describe "can authenticate" do
    context "admin" do
      before {@user4 = FactoryGirl.build :user, admin: true}
      subject(:ability){Ability.new(@user4)}
      it{should be_able_to :manage, Subject}
      it{should be_able_to :manage, Question}
      it{should be_able_to :manage, User}
      it{should be_able_to :manage, Exam}
    end

    context "user" do
      before {@user3 = FactoryGirl.build :user, admin: false}
      subject(:ability){Ability.new(@user3)}
      it{should_not be_able_to :manage, Subject}
      it{should be_able_to :read, Subject}
      it{should be_able_to :manage, Question, @user3.id}
      it{should_not be_able_to :manage, User}
      it{should be_able_to :update, User, @user3.id}
      it{should be_able_to :create, Exam, @user3.id}
      it{should be_able_to :read, Exam, @user3.id}
      it{should be_able_to :update, Exam, @user3.id}
      it{should_not be_able_to :destroy, Exam, @user3.id}
    end
  end
end
