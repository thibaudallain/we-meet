class Meeting < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :attending, presence: true
  validates :address, presence: true
  validates :event_id, presence: true
  validates :user_id, presence: true
  validates :organizer, presence: true
end
