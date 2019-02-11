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

ActiveRecord::Schema.define(version: 0) do
  create_table :topics, force: true do |t|
    t.string :slug
    t.string :title
    t.boolean :completed_all
    t.boolean :started_any
    t.boolean :visible
  end

  create_table :units, force: true do |t|
    t.string :slug
    t.string :title
    t.boolean :completed_all
    t.boolean :started_any
    t.boolean :visible

    t.belongs_to :topic, index: true
  end

  create_table :lessons, force: true do |t|
    t.boolean :complete
    t.string :started_at 
    t.string :updated_at 
    t.boolean :viewed
    t.string :github_repo_name 
    t.string :content_type 
    t.string :canonical_kind 
    t.string :slug 
    t.string :title 
    t.boolean :visible

    t.belongs_to :unit, index: true
  end

  create_table :curriculums, force: true do |t|
    t.string :hash_string
    t.string :slug
    t.string :title
  end

  create_table :users, force: true do |t|
    t.string :email
    t.string :password

    t.integer :topic_id
    t.integer :unit_id
    t.integer :lesson_id
    t.integer :progress_id
  end
end
