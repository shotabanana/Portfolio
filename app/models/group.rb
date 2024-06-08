class Group < ApplicationRecord
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  belongs_to :place
  has_many :chats, dependent: :destroy
  validates :people, presence: true
  validates :theatre, presence: true
  validates :movie, presence: true
  scope :latest, -> { order(created_at: :desc)}
  scope :old, -> { order(created_at: :asc)}
  scope :title, -> { order(title: :asc)}
end
