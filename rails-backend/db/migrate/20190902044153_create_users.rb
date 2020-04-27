# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def self.up
    create_table :users do |t|
      # Custom
      t.string :username
      t.string :bio
      t.boolean :admin, default: false

      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      # Uncomment below if timestamps were not included in your original model.
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
