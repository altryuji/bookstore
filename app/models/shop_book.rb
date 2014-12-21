class ShopBook < ActiveRecord::Base
  belongs_to :shop
  belongs_to :book

  scope :sum_quantity_per_book, -> { group(:book_id).sum(:quantity) }
  scope :show_shop, -> (shop_id) { includes(:book, book: :author).where(shop_id: shop_id).order("books.title") }
end
