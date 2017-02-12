class Trade < ApplicationRecord
  belongs_to :stock
  has_one :trade
  has_one :simple_moving_average
  has_one :exponential_moving_average
  has_one :macd
  has_one :rsi
  has_one :price_difference
  has_one :max_min
end
