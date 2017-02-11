# https://github.com/herval/yahoo-finance

module Yahoo
  class Finance
    PROPERTIES = [:ask, :average_daily_volume, :bid, :close, :high, :low,
                  :market_capitalization, :name, :open, :previous_close,
                  :revenue, :symbol, :trade_date, :volume,
                  :eps_estimate_current_year, :eps_estimate_next_quarter,
                  :eps_estimate_next_year, :peg_ratio, :dividend_per_share,
                  :dividend_yield].freeze

    def get_history(symbol, date = nil)
      date = 700.days.ago if date.nil?
      yahoo_client = YahooFinance::Client.new
      yahoo_client.historical_quotes(symbol, start_date: date)
    end

    def get_quotes(symbols)
      yahoo_client = YahooFinance::Client.new
      yahoo_client.quotes(symbols, PROPERTIES)
    end
  end
end


# ......trade........
# :ask              mercado dispuesto a vender
# :bid              mercado dispuesto a comprar
# :close
# :high
# :low
# :name
# :open             apertura
# :previous_close
# :revenue
# :symbol
# :trade_date
# :volume

# ......fundamentals........
# :eps_estimate_current_year
# :eps_estimate_next_quarter
# :eps_estimate_next_year
# :peg_ratio
# :dividend_per_share
# :dividend_yield
# :market_capitalization
# :average_daily_volume



# :after_hours_change_real_time
# :annualized_gain
# :ask_real_time
# :ask_size
# :bid_real_time
# :bid_size
# :book_value
# :change
# :change_and_percent_change
# :change_from_200_day_moving_average
# :change_from_50_day_moving_average
# :change_from_52_week_high
# :change_From_52_week_low
# :change_in_percent
# :change_percent_realtime
# :change_real_time
# :comission
# :day_value_change
# :day_value_change_realtime
# :days_range
# :days_range_realtime
# :dividend_pay_date
# :earnings_per_share
# :ebitda
# :error_indicator
# :ex_dividend_date
# :float_shares
# :high_52_weeks
# :high_limit
# :holdings_gain
# :holdings_gain_percent
# :holdings_gain_percent_realtime
# :holdings_gain_realtime
# :holdings_value
# :holdings_value_realtime
# :last_trade_date
# :last_trade_price
# :last_trade_realtime_withtime
# :last_trade_size
# :last_trade_time
# :last_trade_with_time
# :low_52_weeks
# :low_limit
# :market_cap_realtime
# :more_info
# :moving_average_200_day
# :moving_average_50_day
# :notes
# :one_year_target_price
# :order_book
# :pe_ratio
# :pe_ratio_realtime
# :percent_change_from_200_day_moving_average
# :percent_change_from_50_day_moving_average
# :percent_change_from_52_week_high
# :percent_change_from_52_week_low
# :price_eps_estimate_current_year
# :price_eps_Estimate_next_year
# :price_paid
# :price_per_book
# :price_per_sales
# :shares_outstanding
# :shares_owned
# :short_ratio
# :stock_exchange
# :ticker_trend
# :trade_links
# :weeks_range_52
