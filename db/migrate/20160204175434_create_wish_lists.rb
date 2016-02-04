class CreateWishLists < ActiveRecord::Migration
  def change
    create_table :wish_lists do |t|
      t.references :user, index: true, foreign_key: true
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
