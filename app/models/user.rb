class User < ApplicationRecord
  
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :notes, through: :user_stocks


  has_secure_password

  validates :first_name, presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  validates :password, presence: true

end
