# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_804_072_101) do
  create_table 'events', force: :cascade do |t|
    t.string 'name'
    t.string 'country'
    t.integer 'day'
    t.integer 'month'
    t.integer 'year'
    t.string 'description'
  end

  create_table 'memories', force: :cascade do |t|
    t.integer 'event_id'
    t.integer 'user_id'
    t.string 'title'
    t.string 'body'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'email'
    t.string 'password_digest'
    t.string 'bio'
    t.integer 'admin'
  end
end