class AddRatingToMoviesAndSearches < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :rating, :decimal, precision: 2, scale: 1
    add_column :searches, :rating, :decimal, precision: 2, scale: 1
  end
end
