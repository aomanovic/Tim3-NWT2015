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

ActiveRecord::Schema.define(version: 20150526213541) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anamneses", force: true do |t|
    t.integer  "PersonID"
    t.integer  "MedicalFacilityID"
    t.datetime "DateOfCreation"
    t.integer  "UserID"
    t.string   "Remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", force: true do |t|
    t.integer  "EvidentionID"
    t.string   "Image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "binaries", force: true do |t|
    t.binary "data"
  end

  create_table "diagnoses", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dt_links", force: true do |t|
    t.integer  "DiagnoseID"
    t.integer  "TherapyID"
    t.string   "Description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ed_links", force: true do |t|
    t.integer  "EvidentionID"
    t.integer  "DiagnoseID"
    t.string   "Description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "es_links", force: true do |t|
    t.integer  "EvidentionID"
    t.integer  "SymptomID"
    t.string   "Description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evidentions", force: true do |t|
    t.integer  "AnamnesisID"
    t.integer  "PersonID"
    t.integer  "MedicalStuffID"
    t.datetime "Date"
    t.string   "Remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "master_medical_facilities", force: true do |t|
    t.string   "Code"
    t.string   "Name"
    t.string   "Address"
    t.string   "Telephone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measurements", force: true do |t|
    t.integer  "PersonID"
    t.string   "VP1"
    t.string   "VP2"
    t.string   "VP3"
    t.datetime "Date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicaments", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "Name"
    t.string   "Surname"
    t.datetime "DateOfBirth"
    t.integer  "UserTypeID"
    t.string   "Address"
    t.string   "Telephone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "privileges", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_privileges", force: true do |t|
    t.integer  "role_id"
    t.integer  "privilege_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "symptoms", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "therapies", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tm_links", force: true do |t|
    t.integer  "TherapyID"
    t.integer  "MedicamentID"
    t.string   "Quantity"
    t.string   "Description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", force: true do |t|
    t.string   "filename"
    t.string   "content_type"
    t.integer  "size"
    t.integer  "binary_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_diagnoses", force: true do |t|
    t.integer  "user_id"
    t.integer  "diagnosis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_symptoms", force: true do |t|
    t.integer  "user_id"
    t.integer  "symptom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_types", force: true do |t|
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "is_active",       default: true, null: false
    t.integer  "user_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visits", force: true do |t|
    t.integer  "PersonID"
    t.datetime "Date"
    t.integer  "MedicalStuffID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
