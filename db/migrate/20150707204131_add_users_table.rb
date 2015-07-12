class AddUsersTable < ActiveRecord::Migration
  def change
    create_table "users", force: :cascade do |t|
      t.string   "first_name"
      t.string   "surname"
      t.string   "watchbug_id"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end
  end
end
