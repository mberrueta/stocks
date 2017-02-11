class Init < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks, force: :cascade do |t|
      t.string   :name,                        null: false
      t.string   :symbol,                      null: false
      t.string   :description, default: '',    null: false
      t.string   :notes,       default: '',    null: false
      t.string   :tags,        default: '',    null: false
      t.string   :category,    default: '',    null: false
      t.boolean  :favorite,    default: false, null: false
      t.boolean  :blacklist,   default: false
      t.integer  :ranking,     default: 0
      t.timestamps null: false
      t.index [:symbol], unique: true
    end

    create_table :fundamentals, force: :cascade do |t|
      t.integer  :stock_id,                                null: false
      t.float    :capital,                   default: 0.0, null: false
      t.float    :revenue,                   default: 0.0, null: false
      t.float    :avg_volumen,               default: 0.0, null: false
      # earning per share
      t.float    :eps_estimate_current_year, default: 0.0, null: false
      t.float    :eps_estimate_next_year,    default: 0.0, null: false
      t.float    :eps_estimate_next_quarter, default: 0.0, null: false
      # price-to-earnings ratio
      t.float    :per_ratio,                 default: 0.0, null: false
      # measure of the volatility, > 1 is more than market, <1 less than market
      # e.g. 1.75 is  75% more than market
      t.float    :beta,                      default: 0.0, null: false
      t.float    :dividend_per_share,        default: 0.0, null: false
      # income return on an investment,
      t.float    :dividend_yield,            default: 0.0, null: false
      t.float    :market_capitalization,     default: 0.0, null: false
      t.float    :ask,                       default: 0.0, null: false
      t.float    :bid,                       default: 0.0, null: false
      t.timestamps null: false
    end
    add_index :fundamentals, :stocks

    create_table :trades, force: :cascade do |t|
      t.integer  :stock_id,                                        null: false
      t.date     :date,                                            null: false
      t.float    :open,                            default: 0.0,   null: false
      t.float    :close,                           default: 0.0,   null: false
      t.float    :high,                            default: 0.0,   null: false
      t.float    :low,                             default: 0.0,   null: false
      t.float    :volume,                          default: 0.0,   null: false
      t.timestamps null: false
    end
    add_index :trades, :stocks

    create_table :simple_moving_averages, force: :cascade do |t|
      t.integer  :trade_id,                                        null: false
      t.float    :tec_ma_10
      t.float    :tec_ma_20
      t.float    :tec_ma_50
      t.float    :tec_ma_100
      t.integer  :short_days_last_intersection,                    default: 0
      t.integer  :medium_days_last_intersection,                   default: 0
      t.integer  :large_days_last_intersection,                    default: 0
    end
    add_index :simple_moving_averages, :trades

    create_table :exponential_moving_averages, force: :cascade do |t|
      t.integer  :trade_id,                                        null: false
      t.float    :tec_ema_10
      t.float    :tec_ema_20
      t.float    :tec_ema_50
      t.float    :tec_ema_100
      t.integer  :short_days_last_intersection,                    default: 0
      t.integer  :medium_days_last_intersection,                   default: 0
      t.integer  :large_days_last_intersection,                    default: 0
    end
    add_index :exponential_moving_averages, :trades

    create_table :macds, force: :cascade do |t|
      t.integer  :trade_id,                                        null: false
      t.float    :line
      t.float    :signal
      t.float    :histogram
      t.integer  :last_intersection,                               default: 0
      t.integer  :yesterday_diff,                                  default: 0
    end
    add_index :macds, :trades

    create_table :rsis, force: :cascade do |t|
      t.integer  :trade_id,                                        null: false
      t.float    :rsi
    end
    add_index :rsis, :trades

    create_table :price_differences, force: :cascade do |t|
      t.integer  :trade_id,                                        null: false
      t.float    :yesterday_diff,                  default: 0.0
      t.float    :yesterday_perc,                  default: 0.0
      t.float    :before_yesterday_diff,           default: 0.0
      t.float    :before_yesterday_perc,           default: 0.0
      t.float    :prev_week_diff,                  default: 0.0
      t.float    :prev_week_perc,                  default: 0.0
      t.float    :two_weeks_ago_diff,              default: 0.0
      t.float    :two_weeks_ago_perc,              default: 0.0
      t.float    :prev_month_diff,                 default: 0.0
      t.float    :prev_month_perc,                 default: 0.0
      t.float    :two_months_ago_diff,             default: 0.0
      t.float    :two_months_ago_perc,             default: 0.0
      t.float    :prev_year_diff,                  default: 0.0
      t.float    :prev_year_perc,                  default: 0.0
      t.float    :two_years_ago_diff,              default: 0.0
      t.float    :two_years_ago_perc,              default: 0.0
    end
    add_index :price_differences, :trades

    create_table :max_mins, force: :cascade do |t|
      t.integer  :trade_id,                                        null: false
      t.boolean  :is_year_max,                     default: false
      t.boolean  :is_year_min,                     default: false
      t.boolean  :is_month_max,                    default: false
      t.boolean  :is_month_min,                    default: false
      t.boolean  :is_week_max,                     default: false
      t.boolean  :is_week_min,                     default: false
      t.float    :year_max_diff,                   default: 0.0
      t.float    :year_min_diff,                   default: 0.0
      t.float    :month_max_diff,                  default: 0.0
      t.float    :month_min_diff,                  default: 0.0
      t.float    :week_max_diff,                   default: 0.0
      t.float    :week_min_diff,                   default: 0.0
    end
    add_index :max_mins, :trades

  end
end
