class Note < ApplicationRecord
  belongs_to :user_stock
  

  validates :title, presence: true
  validates :content, presence: true
  validates :article_url, presence: false 

end
