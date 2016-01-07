class Exam < ActiveRecord::Base
  after_update :send_email_result_exam

  enum status: [:start, :testing, :unchecked, :checked]
  UPDATE_STATUS = {finish: 2, accepted: 3}

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

  UPDATE_STATUS.each do |key, value|
    define_method "#{key}" do
      update_attributes status: value
    end
  end

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

  def send_email_result_exam
    HardWorker.perform_async self.id if self.checked?
  end
end
