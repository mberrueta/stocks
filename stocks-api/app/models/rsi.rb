class Rsi < ApplicationRecord
  belongs_to :trade
  validates :trade, presence: true
end
