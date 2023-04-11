class RemoveThumbsDownFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :thumbs_up, :int
    remove_column :movies, :thumbs_down, :int
  end
end
