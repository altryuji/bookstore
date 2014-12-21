class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.references :author, null: false, index: true

      t.timestamps
    end
  end
end
