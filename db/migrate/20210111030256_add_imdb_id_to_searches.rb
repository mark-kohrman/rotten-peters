class AddImdbIdToSearches < ActiveRecord::Migration[6.0]
  def change
    def change
      add_column :searches, :imdb_id, :string
    end
  end
end
