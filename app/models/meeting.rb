class Meeting < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :address, presence: true
  validates :event_id, presence: true
  validates :user_id, presence: true
  validates_inclusion_of :organizer, in: [true, false]
  validates_inclusion_of :attending, in: [true, false]
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
