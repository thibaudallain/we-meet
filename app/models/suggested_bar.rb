class SuggestedBar < ApplicationRecord
  belongs_to :event
  belongs_to :bar
  validates :event_id, presence: true
  validates :bar_id, presence: true, uniqueness: { scope: :event_id }
end
