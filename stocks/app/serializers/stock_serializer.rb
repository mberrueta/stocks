class StockSerializer < ActiveModel::Serializer
  attributes :name, :symbol, :description, :notes, :tags, :category, :favorite, :blacklist, :ranking, :rava_symbol, :google_symbol, :investing_symbol

  belongs_to :fundamental
  has_one :last_trade, serializer: ::TradeSerializer

  has_one :fundamentals
  has_many :trades

  # def last_trade
  #   # binding.pry
  #   return { "trade" : null } unless object.last_trade.nil?
  #   object.last_trade
  # end
end
