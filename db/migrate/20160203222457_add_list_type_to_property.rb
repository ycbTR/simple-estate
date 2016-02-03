class AddListTypeToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :listing_type, :string
  end
end
