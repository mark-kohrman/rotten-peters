class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :release_year
      t.string :runtime
      t.string :description
      t.string :img_url
      t.string :thumbs_up?

      t.timestamps
    end
  end
end
