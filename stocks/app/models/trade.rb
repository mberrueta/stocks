require 'yahoo/finance'

class Trade < ApplicationRecord
  belongs_to :stock
  has_one :trade
  has_one :simple_moving_average
  has_one :exponential_moving_average
  has_one :macd
  has_one :rsi
  has_one :price_difference
  has_one :max_min

  scope :by_date, ->(date) { where(date: date) }
  scope :less_date_than, ->(date) { order(date: :desc).where('date < ?', date) }
  scope :by_timeframe, ->(a, b) { where('date BETWEEN ? AND ?', a, b) }
  scope :by_symbol, ->(symbol) { joins(:stock).where('stocks.symbol = ?', symbol).order(date: :desc) }
  scope :by_stock_id, ->(stock_id) { where('stock_id = ?', stock_id) }
  scope :last_one, -> { order(date: :desc).limit(1) }

  def self.from_yahoo_data(stock, data)
    t = Trade.find_or_create_by(stock: stock, date: data.trade_date)
    t.assign_attributes(open: data.open,
                        close: data.close,
                        high: data.high,
                        low: data.low,
                        volume: data.volume)
    t
  end
end
