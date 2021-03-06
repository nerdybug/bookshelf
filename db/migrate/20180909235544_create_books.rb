class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :user_id
      t.integer :author_id
      t.integer :genre_id
      t.integer :occasion_id
      t.integer :gifter_id
      t.integer :pub_year
      t.string :note
      t.boolean :favorite, :default => false
      t.timestamps
    end
  end
end
