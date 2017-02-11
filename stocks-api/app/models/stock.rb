class Stock < ApplicationRecord
  has_many :fundamentals
  has_many :trades
  validates :symbol, :name, presence: true
end
