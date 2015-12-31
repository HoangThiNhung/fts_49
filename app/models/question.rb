class Question < ActiveRecord::Base
  has_many :options, dependent: :destroy
  belongs_to :subject
  belongs_to :user
end
