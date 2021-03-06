class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and  :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
  :validatable, :confirmable, :registerable

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_length_of :description, maximum: 150

  has_many :user_studios
  has_many :trainer_studios
  has_many :trainer_events, foreign_key: 'trainer_id', class_name: 'Event'
  has_many :trainee_events, foreign_key: 'trainee_id', class_name: 'Event'
  has_many :offers, foreign_key: 'trainer_id'
  has_many :milestones, foreign_key: 'trainer_id'
  has_many :users_practice_categories, foreign_key: 'trainer_id'
  has_many :users_specialty_categories, foreign_key: 'trainer_id'

  scope :trainer, -> { where(role: 1) }
  scope :basic, -> { where(role: 0) }

  def self.search(search)
    where("first_name ILIKE ? OR last_name ILIKE ?", "%#{search}%", "%#{search}%")
    .trainer
  end
end
