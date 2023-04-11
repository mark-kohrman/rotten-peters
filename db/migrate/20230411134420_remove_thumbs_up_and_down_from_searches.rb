class RemoveThumbsUpAndDownFromSearches < ActiveRecord::Migration[6.0]
  def change
    remove_column :searches, :thumbs_up, :int
    remove_column :searches, :thumbs_down, :int
  end
end
