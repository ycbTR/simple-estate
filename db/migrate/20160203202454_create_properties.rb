class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :city
      t.string :country
      t.string :street1
      t.string :street2
      t.float :lat
      t.float :long
      t.string :zipcode
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
