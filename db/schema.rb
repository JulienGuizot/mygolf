# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160612105503) do

  create_table "games", force: :cascade do |t|
  	t.boolean "current", :null => true
  	t.integer "stage_id", :null => true, :references => [:stages, :id]
  end

  create_table "golfers", force: :cascade do |t|  
    t.string "name"
    t.string "sexe"
    t.integer "handicap"
    t.integer "score_id", :null => true, :references => [:scores, :id]
  end

  create_table "holes", force: :cascade do |t|
    t.integer "number"
    t.float "distance_m"
    t.float "distance_w"
    t.integer "par"
    t.integer "stage_id", :null => true, :references => [:stages, :id]
  end

  create_table "scores", force: :cascade do |t|
    t.integer "game_id", :null => true, :references => [:games, :id]
  end

  create_table "score_by_holes", force: :cascade do |t|
    t.integer "nb_shots"
    t.integer "number"
    t.integer "score_id", :null => true, :references => [:scores, :id]
  end

  create_table "stages", force: :cascade do |t|
    t.string "title"
    t.string "country"
    t.string "city"
    t.integer "holes_count"
  end

end
