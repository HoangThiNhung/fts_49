class StaticPageController < ApplicationController
  before_action :load_activities

  def home
  end

  def about
  end

  private
  def load_activities
    @activities = PublicActivity::Activity.order("created_at desc")
      .page(params[:page]).per Settings.activities.paginate
  end
end
