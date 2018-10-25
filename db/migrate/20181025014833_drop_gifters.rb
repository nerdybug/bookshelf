class DropGifters < ActiveRecord::Migration[5.2]
  def change
    drop_table :gifters
  end
end
