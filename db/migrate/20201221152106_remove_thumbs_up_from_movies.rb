class RemoveThumbsUpFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :thumbs_up?, :string
  end
end
