class Bar < ApplicationRecord
  has_many :suggested_bars
  validates :name, presence: true
  validates :address, presence: true, uniqueness: { scope: :name }
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
