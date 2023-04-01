class Task < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  has_many :realizations, dependent: :destroy


  scope :upcoming_deadline, -> { where('deadline > ?', Time.zone.now).order('deadline ASC') }
end
