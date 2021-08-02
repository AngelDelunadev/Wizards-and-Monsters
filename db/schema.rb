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

ActiveRecord::Schema.define(version: 2021_07_23_174049) do

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.string "element_type"
    t.integer "damage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "battles", force: :cascade do |t|
    t.string "results"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "monster_id"
    t.integer "wizard_id"
    t.index ["monster_id"], name: "index_battles_on_monster_id"
    t.index ["wizard_id"], name: "index_battles_on_wizard_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.string "element_type"
    t.integer "hp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ability_id"
    t.index ["ability_id"], name: "index_monsters_on_ability_id"
  end

  create_table "wizards", force: :cascade do |t|
    t.string "name"
    t.string "element_type"
    t.integer "hp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ability_id"
    t.index ["ability_id"], name: "index_wizards_on_ability_id"
  end

  add_foreign_key "battles", "monsters"
  add_foreign_key "battles", "wizards"
  add_foreign_key "monsters", "abilities"
  add_foreign_key "wizards", "abilities"
end
