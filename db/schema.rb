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

ActiveRecord::Schema.define(:version => 20150816125406) do

  create_table "bkdetails", :force => true do |t|
    t.datetime "logDate"
    t.integer  "actualValue",      :precision => 38, :scale => 0
    t.integer  "targetPercentage", :precision => 38, :scale => 0
    t.integer  "targetValue",      :precision => 38, :scale => 0
    t.text     "notes"
    t.integer  "kpi_id",           :precision => 38, :scale => 0
    t.integer  "business_id",      :precision => 38, :scale => 0
    t.integer  "businesskpi_id",   :precision => 38, :scale => 0
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "business_kpis", :force => true do |t|
    t.integer  "business_id", :precision => 38, :scale => 0
    t.integer  "kpi_id",      :precision => 38, :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "businesses", :force => true do |t|
    t.string   "branchname"
    t.string   "branchtype"
    t.string   "branchaddress"
    t.string   "contactnumbers"
    t.string   "owner_id"
    t.string   "facebook_id"
    t.string   "twitter_id"
    t.string   "emailid"
    t.string   "shortname"
    t.string   "city"
    t.string   "maplink"
    t.string   "workinghours"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "franchisemasters", :force => true do |t|
    t.string   "franchiseename"
    t.string   "franchisename"
    t.string   "franchisetype"
    t.string   "emailid"
    t.datetime "openingdate"
    t.datetime "effectivefrom"
    t.string   "business_id"
    t.string   "address"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "kpis", :force => true do |t|
    t.string   "KPIName"
    t.string   "KPIEntryPeriod"
    t.string   "KPICategory"
    t.string   "KPIDirection"
    t.string   "KPIUnitName"
    t.integer  "KPITargetValue", :precision => 38, :scale => 0
    t.boolean  "active",         :precision => 1,  :scale => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

end
