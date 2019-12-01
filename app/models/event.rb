class Event < ApplicationRecord
  has_many :suggested_bars
  has_many :meetings
  has_many :users, through: :meetings
  # validates :date, presence: true
  validates :start_time, presence: true
  validates :deadline, presence: true
end
