class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :exams, dependent: :destroy
  has_many :questions

  validates :name, presence: true, length: {maximum: 50}

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.uid + "@fts.com"
      user.name     = auth.info.name
      user.password = Devise.friendly_token
      user.password_confirmation = user.password
      user.save
    end
  end
end
