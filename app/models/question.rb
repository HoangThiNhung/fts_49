class Question < ActiveRecord::Base
  acts_as_paranoid
  after_destroy :update_question_as_deleted

  enum status: [:waitting, :accepted, :deleted]
  enum question_type: [:single_choice, :multiple_choice, :text]

  has_many :options, dependent: :destroy
  belongs_to :subject
  belongs_to :user

  validates :content, presence: true

  accepts_nested_attributes_for :options,
                               reject_if: lambda {|a| a[:content].blank?},
                               allow_destroy: true

  private
  def update_question_as_deleted
    self.update_attributes status: :deleted
  end
end
