class Result < ActiveRecord::Base
  belongs_to :exam
  belongs_to :question
  belongs_to :option

  scope :correct_answer, -> {joins(:option).where options: {is_correct: true}}
end
