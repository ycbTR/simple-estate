class AddTitleDescriptionToPropertes < ActiveRecord::Migration
  def change
    add_column :properties, :title, :string
    add_column :properties, :description, :text
    add_column :properties, :price, :float
  end
end
