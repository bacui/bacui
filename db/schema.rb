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

ActiveRecord::Schema.define(version: 2018_08_31_022926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_id"
    t.index ["task_id"], name: "index_actors_on_task_id"
  end

  create_table "actors_users", id: false, force: :cascade do |t|
    t.bigint "actor_id", null: false
    t.bigint "user_id", null: false
    t.index ["actor_id"], name: "index_actors_users_on_actor_id"
    t.index ["user_id"], name: "index_actors_users_on_user_id"
  end

  create_table "artifacts", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_actor_id"
    t.index ["author_actor_id"], name: "index_artifacts_on_author_actor_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "archived", default: false
    t.bigint "instructor_id"
    t.index ["instructor_id"], name: "index_courses_on_instructor_id"
  end

  create_table "critiques", force: :cascade do |t|
    t.text "comment"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_id"
    t.index ["question_id"], name: "index_critiques_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.float "weight"
    t.float "min_score"
    t.float "max_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_id"
    t.index ["task_id"], name: "index_questions_on_task_id"
  end

  create_table "review_mappings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assessor_actor_id"
    t.bigint "assessee_actor_id"
    t.index ["assessee_actor_id"], name: "index_review_mappings_on_assessee_actor_id"
    t.index ["assessor_actor_id"], name: "index_review_mappings_on_assessor_actor_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer "num_reviewed_artifacts"
    t.boolean "include_self_review"
    t.boolean "archived"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_size", default: 1
    t.bigint "course_id"
    t.string "type"
    t.bigint "reviewed_task_id"
    t.index ["course_id"], name: "index_tasks_on_course_id"
  end

  create_table "user_courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "actors", "tasks"
  add_foreign_key "artifacts", "actors", column: "author_actor_id"
  add_foreign_key "courses", "users", column: "instructor_id"
  add_foreign_key "critiques", "questions"
  add_foreign_key "questions", "tasks"
  add_foreign_key "review_mappings", "actors", column: "assessee_actor_id"
  add_foreign_key "review_mappings", "actors", column: "assessor_actor_id"
  add_foreign_key "tasks", "courses"
end
