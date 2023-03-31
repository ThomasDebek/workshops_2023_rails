class Task < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true


  scope :upcoming_deadline, -> { where('deadline > ?', Time.zone.now).order('deadline ASC') }
end
