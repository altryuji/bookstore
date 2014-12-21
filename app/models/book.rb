class Book < ActiveRecord::Base
  belongs_to :author

  has_many :shops, through: :shop_books
  has_many :shop_books

  scope :order_by_author_name_and_book_id,
    -> { includes(:author).order("authors.name, books.id") }
end
