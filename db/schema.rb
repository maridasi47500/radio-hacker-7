# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_11_14_015343) do
  create_table "idontlikes", force: :cascade do |t|
    t.integer "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jsonradios", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.string "stream"
    t.string "mysong"
    t.string "mytime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "numberid"
  end

  create_table "lyrics", force: :cascade do |t|
    t.integer "song_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "mytime"
  end

  create_table "rssradios", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.string "stream"
    t.string "mysong"
    t.string "mytime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "myradio"
    t.integer "radio_id"
    t.string "someradio"
  end

  create_table "synthes", force: :cascade do |t|
    t.integer "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
