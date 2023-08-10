ActiveRecord::Schema[7.0].define(version: 2023_08_08_141122) do
    create_table "posts", force: :cascade do |t|
      t.string "title"
      t.text "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean "published"
    end
  
  end