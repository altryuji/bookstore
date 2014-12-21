class CreateShopBooks < ActiveRecord::Migration
  def change
    create_table :shop_books do |t|
      t.references :shop,     null: false, index: true
      t.references :book,     null: false, index: true
      t.integer    :quantity, null: false, default: 0

      t.timestamps
    end
  end
end
