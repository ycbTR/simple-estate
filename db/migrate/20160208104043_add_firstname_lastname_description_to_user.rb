class AddFirstnameLastnameDescriptionToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :description, :text
  end
end
