class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, authentication_keys: [:phone_number]
  validates :phone_number, presence: true, uniqueness: true
  has_many :meetings

  def password_required?
    false
  end

  def email_required?
    false
  end
end
