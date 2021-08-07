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

ActiveRecord::Schema.define(version: 2021_06_05_005234) do

  create_table "animal_types", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "animals", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "countory_id", comment: "原産国"
    t.bigint "animal_type_id"
    t.string "name"
    t.integer "weight"
    t.integer "height"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.column "body", "enum('small','middle','large')", null: false
    t.column "hair", "enum('none','short','long')", null: false
    t.boolean "visible", default: true
    t.index ["animal_type_id"], name: "index_animals_on_animal_type_id"
    t.index ["countory_id"], name: "index_animals_on_countory_id"
  end

  create_table "countories", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.boolean "has_pet"
    t.boolean "married"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.column "sex", "enum('male','female')", null: false
  end

  create_table "question_tags", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_question_tags_on_question_id"
    t.index ["tag_id"], name: "index_question_tags_on_tag_id"
  end

  create_table "questions", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "member_id"
    t.string "title"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.column "phase", "enum('new','doing','done')", null: false
    t.index ["member_id"], name: "index_questions_on_member_id"
  end

  create_table "tags", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "animals", "animal_types"
  add_foreign_key "animals", "countories"
  add_foreign_key "question_tags", "questions"
  add_foreign_key "question_tags", "tags"
  add_foreign_key "questions", "members"
end
