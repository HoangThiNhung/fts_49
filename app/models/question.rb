class Question < ActiveRecord::Base

  enum status: [:waitting, :accepted]
  enum question_type: [:single_choice, :multiple_choice, :text]

  has_many :options, dependent: :destroy
  belongs_to :subject
  belongs_to :user

  validates :content, presence: true

  accepts_nested_attributes_for :options,
                               reject_if: lambda {|a| a[:content].blank?},
                               allow_destroy: true
end
