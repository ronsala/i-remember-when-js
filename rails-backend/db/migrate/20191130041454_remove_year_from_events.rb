class RemoveYearFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :year, :integer
  end
end
