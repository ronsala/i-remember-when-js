class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :country
      t.integer :day
      t.integer :month
      t.integer :year
      t.string :description
    end
  end
end
