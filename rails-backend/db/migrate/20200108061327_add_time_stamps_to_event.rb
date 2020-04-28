class AddTimeStampsToEvent < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :events, null: true

    change_column_null :events, :created_at, false
    change_column_null :events, :updated_at, false
  end
end
