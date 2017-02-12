class TradeSerializer < SimpleTradeSerializer
  has_one :stock
  has_one :fundamental
end
