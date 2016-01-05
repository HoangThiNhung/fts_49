class Subject < ActiveRecord::Base
  resourcify
  
  has_many :exams, dependent: :destroy
  has_many :questions, dependent: :destroy
end
