class RemoveGifterAndOccasionIdsFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :gifter_id
    remove_column :books, :occasion_id
  end
end
