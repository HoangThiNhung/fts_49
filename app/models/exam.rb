class Exam < ActiveRecord::Base
  enum status: [:start, :testing, :unchecked, :checked]

  belongs_to :subject
  belongs_to :user
  has_many :results, dependent: :destroy
  has_many :questions, through: :results

  validates :duration, presence: true
  validates :subject_id, presence: true
  validates :status, presence: true
  validates :user_id, presence: true

  before_create :add_questions
  before_validation :set_number_of_question

  accepts_nested_attributes_for :results

  private
  def add_questions
    self.questions = subject.questions.accepted.order("RANDOM()").
      limit number_question
  end

  def set_number_of_question
    if subject.questions.size > 10
      self.number_question = 10
    else
      self.number_question = subject.questions.size
    end
  end
end
