class AddDefaultValueToThumbsUp < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :thumbs_up, :integer, default: 0
  end
end
