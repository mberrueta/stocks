namespace :fetch_prices do

  desc 'init data'
  task start: :environment do
    Stock.all.each do |stock|
      begin
        puts "Working with #{stock.symbol}"
        trades = stock.update_trades_form_yahoo
        puts "total trades: #{trades.count}"
      rescue
        next
      end
    end
  end
end
