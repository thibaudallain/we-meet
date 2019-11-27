class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :name, :phone_number, :address, presence: :true

  has_many :meetings

  def password_required?
    false
  end

  def email_required?
    false
  end
end
