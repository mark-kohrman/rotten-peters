class AddImageUrlToSearches < ActiveRecord::Migration[6.0]
  def change
    add_column :searches, :img_url, :string
  end
end
