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

ActiveRecord::Schema.define(version: 20170211122914) do

  create_table "exponential_moving_averages", force: :cascade do |t|
    t.integer "trade_id",                                  null: false
    t.float   "tec_ema_10"
    t.float   "tec_ema_20"
    t.float   "tec_ema_50"
    t.float   "tec_ema_100"
    t.integer "short_days_last_intersection",  default: 0
    t.integer "medium_days_last_intersection", default: 0
    t.integer "large_days_last_intersection",  default: 0
    t.index [nil], name: "index_exponential_moving_averages_on_trades"
  end

  create_table "fundamentals", force: :cascade do |t|
    t.integer  "stock_id",                                null: false
    t.float    "capital",                   default: 0.0, null: false
    t.float    "revenue",                   default: 0.0, null: false
    t.float    "avg_volumen",               default: 0.0, null: false
    t.float    "eps_estimate_current_year", default: 0.0, null: false
    t.float    "eps_estimate_next_year",    default: 0.0, null: false
    t.float    "eps_estimate_next_quarter", default: 0.0, null: false
    t.float    "per_ratio",                 default: 0.0, null: false
    t.float    "beta",                      default: 0.0, null: false
    t.float    "dividend_per_share",        default: 0.0, null: false
    t.float    "dividend_yield",            default: 0.0, null: false
    t.float    "market_capitalization",     default: 0.0, null: false
    t.float    "ask",                       default: 0.0, null: false
    t.float    "bid",                       default: 0.0, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index [nil], name: "index_fundamentals_on_stocks"
  end

  create_table "macds", force: :cascade do |t|
    t.integer "trade_id",                      null: false
    t.float   "line"
    t.float   "signal"
    t.float   "histogram"
    t.integer "last_intersection", default: 0
    t.integer "yesterday_diff",    default: 0
    t.index [nil], name: "index_macds_on_trades"
  end

  create_table "max_mins", force: :cascade do |t|
    t.integer "trade_id",                       null: false
    t.boolean "is_year_max",    default: false
    t.boolean "is_year_min",    default: false
    t.boolean "is_month_max",   default: false
    t.boolean "is_month_min",   default: false
    t.boolean "is_week_max",    default: false
    t.boolean "is_week_min",    default: false
    t.float   "year_max_diff",  default: 0.0
    t.float   "year_min_diff",  default: 0.0
    t.float   "month_max_diff", default: 0.0
    t.float   "month_min_diff", default: 0.0
    t.float   "week_max_diff",  default: 0.0
    t.float   "week_min_diff",  default: 0.0
    t.index [nil], name: "index_max_mins_on_trades"
  end

  create_table "price_differences", force: :cascade do |t|
    t.integer "trade_id",                            null: false
    t.float   "yesterday_diff",        default: 0.0
    t.float   "yesterday_perc",        default: 0.0
    t.float   "before_yesterday_diff", default: 0.0
    t.float   "before_yesterday_perc", default: 0.0
    t.float   "prev_week_diff",        default: 0.0
    t.float   "prev_week_perc",        default: 0.0
    t.float   "two_weeks_ago_diff",    default: 0.0
    t.float   "two_weeks_ago_perc",    default: 0.0
    t.float   "prev_month_diff",       default: 0.0
    t.float   "prev_month_perc",       default: 0.0
    t.float   "two_months_ago_diff",   default: 0.0
    t.float   "two_months_ago_perc",   default: 0.0
    t.float   "prev_year_diff",        default: 0.0
    t.float   "prev_year_perc",        default: 0.0
    t.float   "two_years_ago_diff",    default: 0.0
    t.float   "two_years_ago_perc",    default: 0.0
    t.index [nil], name: "index_price_differences_on_trades"
  end

  create_table "rsis", force: :cascade do |t|
    t.integer "trade_id", null: false
    t.float   "rsi"
    t.index [nil], name: "index_rsis_on_trades"
  end

  create_table "simple_moving_averages", force: :cascade do |t|
    t.integer "trade_id",                                  null: false
    t.float   "tec_ma_10"
    t.float   "tec_ma_20"
    t.float   "tec_ma_50"
    t.float   "tec_ma_100"
    t.integer "short_days_last_intersection",  default: 0
    t.integer "medium_days_last_intersection", default: 0
    t.integer "large_days_last_intersection",  default: 0
    t.index [nil], name: "index_simple_moving_averages_on_trades"
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "name",                             null: false
    t.string   "symbol",                           null: false
    t.string   "description",      default: "",    null: false
    t.string   "notes",            default: "",    null: false
    t.string   "tags",             default: "",    null: false
    t.string   "category",         default: "",    null: false
    t.boolean  "favorite",         default: false, null: false
    t.boolean  "blacklist",        default: false
    t.integer  "ranking",          default: 0
    t.string   "rava_symbol"
    t.string   "google_symbol"
    t.string   "investing_symbol"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["symbol"], name: "index_stocks_on_symbol", unique: true
  end

  create_table "trades", force: :cascade do |t|
    t.integer  "stock_id",                 null: false
    t.date     "date",                     null: false
    t.float    "open",       default: 0.0, null: false
    t.float    "close",      default: 0.0, null: false
    t.float    "high",       default: 0.0, null: false
    t.float    "low",        default: 0.0, null: false
    t.float    "volume",     default: 0.0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index [nil], name: "index_trades_on_stocks"
  end

end
