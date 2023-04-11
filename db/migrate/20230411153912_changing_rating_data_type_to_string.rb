class ChangingRatingDataTypeToString < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :rating, :string
    change_column :searches, :rating, :string
  end
end
