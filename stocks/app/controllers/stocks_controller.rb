class StocksController < ApplicationController

  def stock_quote
    params.require(:symbol)
    symbol = params[:symbol]
    stock = Stock.by_symbol(symbol)
    render json: stock
  end

  def stock_history
    params.require(:symbol)
    symbol = params[:symbol]
    trades = Trade.by_symbol(symbol)

    render json: trades, each_serializer: ::SimpleTradeSerializer
  end

  def all_quotes
    date = params[:date] || Date.today
    stocks = Trade.where(date: date).limit(MAX_LIMIT)
    render json: stocks
  end

  def counts
    render json: { stocks: Stock.all.count, fundamental: Fundamental.all.count, trades: Trade.all.count }
  end

  def init
    ActiveRecord::Base.transaction do
      service.get_quotes(SYMBOLS).each do |data|
        stock = Stock.from_yahoo_data(data)
        stock.save! if stock.valid?
        fundamental = Fundamental.from_yahoo_data(stock, data)
        fundamental.save! if fundamental.valid?
        #     render json: fundamental.errors.to_json
        #   render json: stock.errors.to_json
      end
    end
    counts
  end

  def update_stocks
    Stock.all.each do |stock|
      begin
        last_date = (Trade.by_stock_id(stock.id).last_one.first&.date || 100.days.ago) - 1.day
        today = Time.zone.today
        # puts "getting trades for '#{stock.symbol}' since #{last_date}"
        trades = service.get_history(stock.symbol, last_date)
        trade = service.get_quotes([stock.symbol]).first unless today.saturday? || today.sunday?
        unless trade.nil?
          # puts "today trade #{trade}"
          trade.trade_date = Time.zone.today
          trades << trade
        end
        # puts "there are => #{trades.count}"
        save_trades(stock, trades)
      rescue
        next
      end
    end
    counts
  end

  def calculate_tech
    Stock.all.each(&:stock.calculate_tech)
  end

  private

  def service
    @service ||= ::Yahoo::Finance.new
  end

  def save_trades(stock, trades)
    ActiveRecord::Base.transaction do
      trades.each do |trade_data|
        trade = Trade.from_yahoo_data(stock, trade_data)
        if trade&.valid?
          trade.save
          trade.calculate_tech
          trade.save
        else
          render json: trade.errors.to_json unless trade.nil?
        end
      end
    end
  end
end

# BasicPerformanceReal-TimeFundamentalsDetailedAdd Custom View
# Add Quotes

# ,'' ,.BAStock Quotes:

# yahoo.finance.quotes
# yahoo.finance.historicaldata
# Fundamental analysis:

# yahoo.finance.keystats
# yahoo.finance.balancesheet
# yahoo.finance.incomestatement
# yahoo.finance.analystestimates
# yahoo.finance.dividendhistory
# Technical analysis:

# yahoo.finance.historicaldata
# yahoo.finance.quotes
# yahoo.finance.quant
# yahoo.finance.option*
# General financial information:

# yahoo.finance.industry
# yahoo.finance.sectors
# yahoo.finance.isin
# yahoo.finance.quoteslist
# yahoo.finance.xchange

end
