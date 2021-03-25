# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_23_163426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aero_plans", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "aero_plans_seat_configurations", force: :cascade do |t|
    t.bigint "aero_plan_id"
    t.bigint "seat_configuration_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aero_plan_id"], name: "index_aero_plans_seat_configurations_on_aero_plan_id"
    t.index ["seat_configuration_id"], name: "index_aero_plans_seat_configurations_on_seat_configuration_id"
  end

  create_table "air_ports", force: :cascade do |t|
    t.string "code"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "date"
    t.integer "departure_airport_id"
    t.bigint "aero_plan_id"
    t.integer "destination_airport_id"
    t.decimal "price_per_business"
    t.decimal "price_per_economy"
    t.decimal "price_per_first"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aero_plan_id"], name: "index_flights_on_aero_plan_id"
  end

  create_table "passenger_bookings", force: :cascade do |t|
    t.bigint "flight_id", null: false
    t.bigint "passenger_id", null: false
    t.integer "seat_type"
    t.string "pnr"
    t.integer "row_number"
    t.integer "seat_number"
    t.float "paid_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flight_id"], name: "index_passenger_bookings_on_flight_id"
    t.index ["passenger_id"], name: "index_passenger_bookings_on_passenger_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seat_configurations", force: :cascade do |t|
    t.integer "seat_type"
    t.integer "number_of_rows"
    t.integer "seats_in_rows"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "passenger_bookings", "flights"
  add_foreign_key "passenger_bookings", "passengers"
end
