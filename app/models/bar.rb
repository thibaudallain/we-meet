class Bar < ApplicationRecord
  has_many :suggested_bars
  validates :name, presence: true
  validates :address, presence: true, uniqueness: { scope: :name }
  validates :description, presence: true
end
