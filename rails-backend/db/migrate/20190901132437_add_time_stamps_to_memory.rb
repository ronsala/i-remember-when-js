# frozen_string_literal: true

class AddTimeStampsToMemory < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :memories, null: true

    change_column_null :memories, :created_at, false
    change_column_null :memories, :updated_at, false
  end
end
