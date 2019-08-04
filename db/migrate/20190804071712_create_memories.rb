class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :title
      t.string :body
    end
  end
end
