class AddThumbsDownColumnToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :thumbs_down, :integer
  end
end
