class SimpleTradeSerializer < ActiveModel::Serializer
  attributes :id, :date, :open, :close, :high, :low, :volume
    # :tec_ma_12, :tec_ma_24, :tec_ma_48, :tec_ma_100, :tec_ma_200,
    # :tec_ma_exp_12, :tec_ma_exp_24, :tec_ma_exp_48, :tec_ma_exp_100, :tec_ma_exp_200,
    # :tec_adx,
    # :tec_macd_12, :tec_macd_26,
    # :yesterday_diff, :yesterday_perc,
    # :before_yesterday_diff, :before_yesterday_perc,
    # :prev_week_diff, :prev_week_perc,
    # :two_weeks_ago_diff, :two_weeks_ago_perc,
    # :prev_month_diff, :prev_month_perc,
    # :two_months_ago_diff, :two_months_ago_perc,
    # :prev_year_diff, :prev_year_perc,
    # :two_years_ago_diff, :two_years_ago_perc,
    # :day_var_perc, :day_var_info,
    # :tec_ma_12_advice, :tec_ma_24_advice, :tec_ma_48_advice,
    # :tec_ma_100_advice, :tec_ma_200_advice,
    # :rsi_up_avg, :rsi_down_avg, :gain, :lost,
    # :tec_rsi_14, :rsi_advice,
    # :mock_expensive_price_rsi14, :mock_cheap_price_rsi14,
    # :mv_intersection_short_advice, :mv_intersection_large_advice, :mv_short_days_last_intersection, :mv_large_days_last_intersection,
    # :is_year_max, :is_year_min, :is_month_max, :is_month_min, :is_week_max, :is_week_min,
    # :year_max_diff, :year_min_diff, :month_max_diff, :month_min_diff, :week_max_diff, :week_min_diff
end
