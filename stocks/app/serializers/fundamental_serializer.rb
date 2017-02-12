class FundamentalSerializer < ActiveModel::Serializer
  attributes :id, :stock_id, :capital, :revenue, :avg_volumen, :eps_estimate_current_year, :eps_estimate_next_year, :eps_estimate_next_quarter, :per_ratio, :beta, :dividend_per_share, :dividend_yield, :market_capitalization, :ask, :bid
end
