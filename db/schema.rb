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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130225225726) do

  create_table "films", :force => true do |t|
    t.integer  "kino_id"
    t.string   "tytul"
    t.integer  "rok"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "films", ["kino_id"], :name => "index_films_on_kino_id"

  create_table "kinos", :force => true do |t|
    t.string   "nazwa"
    t.float    "szerokosc"
    t.float    "dlugosc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projekcjas", :force => true do |t|
    t.integer  "film_id"
    t.date     "data"
    t.time     "godzina"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "projekcjas", ["film_id"], :name => "index_projekcjas_on_film_id"

end
