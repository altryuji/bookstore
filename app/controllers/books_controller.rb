class BooksController < ApplicationController
  def index
    @books = Book.order_by_author_name_and_book_id
  end

  def with_quantity
    book_id_sum_quantity_map = ShopBook.sum_quantity_per_book
    @books_quantities = []

    Book.select([:id, :title]).find_each do |book|
      quantity = book_id_sum_quantity_map.try(:[], book.id) || 0
      @books_quantities << { id: book.id, title: book.title, quantity: quantity }
    end

    @books_quantities.sort_by! { |b| [-b[:quantity], b[:id]] }
  end
end
