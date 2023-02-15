class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :title
      t.string :director
      t.string :release_year
      t.string :description
      t.integer :thumbs_up
      t.integer :thumbs_down

      t.timestamps
    end
  end
end
