class Bar < ApplicationRecord
  has_many :suggested_bars
  validates :name, presence: true
  validates :address, presence: true, uniqueness: { scope: :name }
  has_one_attached :photo
end
