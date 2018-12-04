class Stock < ApplicationRecord

  has_many :user_stocks
  has_many :users, through: :user_stocks
  has_many :notes, through: :user_stocks

end
