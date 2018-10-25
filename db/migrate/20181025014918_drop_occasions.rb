class DropOccasions < ActiveRecord::Migration[5.2]
  def change
    drop_table :occasions
  end
end
