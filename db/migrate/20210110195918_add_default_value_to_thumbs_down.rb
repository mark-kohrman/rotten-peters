class AddDefaultValueToThumbsDown < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :thumbs_down, :integer, default: 0
  end
end
