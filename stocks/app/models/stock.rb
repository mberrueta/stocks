require 'yahoo/finance'

class Stock < ApplicationRecord
  has_one :fundamental, autosave: true
  has_many :trades
  validates :symbol, :name, presence: true

  scope :by_symbol, ->(symbol) { where('symbol = ?', symbol) }

  def last_trade
    @last_trade ||= Trade.by_stock_id(id).last_one.first || Trade.new
  end

  def self.create_form_yahoo(symbols)
    result = []
    Yahoo::Finance.new.get_quotes(symbols).each do |data|
      stock = Stock.new name: data.name, symbol: data.symbol
      next unless stock.valid?
      stock.fundamental = Fundamental.new avg_volumen: data.average_daily_volume,
        market_capitalization: data.market_capitalization,
        revenue: data.revenue, per_ratio: data.peg_ratio,
        eps_estimate_current_year: data.eps_estimate_current_year,
        eps_estimate_next_quarter: data.eps_estimate_next_quarter,
        eps_estimate_next_year: data.eps_estimate_next_year,
        dividend_per_share: data.dividend_per_share,
        dividend_yield: data.dividend_yield,
        ask: data.ask, bid: data.bid
      stock.save! if stock.valid?
      result << stock if stock.valid?
    end
    result
  end

  def update_trades_form_yahoo
    yahoo_trades.each do |trade_data|
      trade = Trade.from_yahoo_data(self, trade_data)
      trade.save if trade&.valid?
    end
    trades
  end

  private

  def last_trade_date
    @last_trade_date ||= Trade.by_stock_id(id).last_one.first&.date || 300.days.ago
  end

  def yahoo_trades
    today = Time.zone.today
    @yahoo_trades ||= begin
      list = service.get_history(symbol, last_trade_date)
      trade = service.get_quotes([symbol]).first unless today.saturday? || today.sunday?
      unless trade.nil?
        trade.trade_date = today
        list << trade
      end
      list
    end
  end

  def service
    @service ||= ::Yahoo::Finance.new
  end
end
