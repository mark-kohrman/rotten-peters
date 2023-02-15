class AddThumbsUpAsIntegerToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :thumbs_up, :integer
  end
end
