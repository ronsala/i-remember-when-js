class RemoveMonthFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :month, :integer
  end
end
