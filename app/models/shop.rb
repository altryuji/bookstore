class Shop < ActiveRecord::Base
  has_many :books, through: :shop_books
  has_many :shop_books
end
