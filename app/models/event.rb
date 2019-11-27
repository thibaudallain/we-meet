class Event < ApplicationRecord
  has_many :suggested_bars
  has_many :meetings
  has_many :users, through: :meetings
  # validates :date, presence: true
  validates :start_time, presence: true
  validates :deadline, presence: true
  validate :deadline_is_before_start_time

  private

  def deadline_is_before_start_time
    if deadline > start_time - 1800
      errors.add(:deadline, "can't be too close from start time")
    end
  end
end
