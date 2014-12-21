# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def authors
  [
    "Stephen King",
    "Neale Donald Walsch",
    "Dave Thomas",
  ]
end

def title_author_map
  {
    "The Mist"              => "Stephen King",
    "Dream Catcher"         => "Stephen King",
    "The Green Mile"        => "Stephen King",
    "Conversation With God" => "Neale Donald Walsch",
    "Home with God"         => "Neale Donald Walsch",
    "Programming Ruby"      => "Dave Thomas",
  }
end

def books_quantities_per_shop
  {
    "Shinjuku Nishiguchi" => {
      "Conversation With God" => 2,
      "Home with God"         => 1,
      "Dream Catcher"         => 1,
      "The Mist"              => 3,
    },
    "Ikebukuro" => {
      "Conversation With God" => 1,
      "The Mist"              => 2,
    },
    "Tokyo Yaesu" => {
      "Dream Catcher"         => 1,
      "The Green Mile"        => 1,
    }
  }
end

def create_authors
  authors.each { |author| Author.where(name: author).first_or_create }
end

def create_books
  author_id_map =
    authors.inject({}) do |h, author|
      a = Author.find_by(name: author)
      h.merge!(author => a.id)
    end

  title_author_map.each do |title, author|
    author_id = author_id_map[author]
    Book.where(title: title, author_id: author_id).first_or_create
  end
end

def create_shop_and_shop_books
  books_quantities_per_shop

  books_quantities_per_shop.each do |shop, quantities|
    shop = Shop.where(name: shop).first_or_create

    quantities.each do |title, quantity|
      book = Book.find_by(title: title)
      ShopBook.where(shop_id: shop.id, book_id: book.id, quantity: quantity).first_or_create
    end
  end
end

create_authors
create_books
create_shop_and_shop_books
