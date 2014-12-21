class BooksController < ApplicationController
  def index
    @books = Book.order_by_author_name_and_book_id
  end

  def with_quantity
    book_id_sum_quantity_map = ShopBook.sum_quantity_per_book
    books = Book.pluck(:id, :title)

    @books_quantities =
      books.map do |id, title|
        quantity = book_id_sum_quantity_map.try(:[], id) || 0
        { id: id, title: title, quantity: quantity }
      end

    @books_quantities.sort_by! { |b| [-b[:quantity], b[:id]] }
  end
end
