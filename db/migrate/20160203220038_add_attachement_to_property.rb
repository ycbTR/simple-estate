class AddAttachementToProperty < ActiveRecord::Migration
  def up
    add_attachment :properties, :image
  end

  def down
    remove_attachment :properties, :image
  end
end
