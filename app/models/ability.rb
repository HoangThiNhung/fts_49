class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin
      can :manage, :all
    else
      can :manage, Question, user_id: user.id
      can [:create, :read, :update], Exam, user_id: user.id
      can :update, User, id: user.id
      can :read, Subject
    end
  end
end
