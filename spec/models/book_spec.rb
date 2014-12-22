require 'rails_helper'

RSpec.describe Book, :type => :model do
  fixtures :authors
  fixtures :books

  let (:books) { Book.order_by_author_name_and_book_id }

  it "returns results ordered by authors.name and books.id" do
    books.each_cons(2) do |b1, b2|
      b1_author_name = b1.author.name
      b2_author_name = b2.author.name

      expect(b1_author_name).to be <= b2_author_name
      expect(b1.id).to be < b2.id if b1_author_name == b2_author_name
    end
  end
end
