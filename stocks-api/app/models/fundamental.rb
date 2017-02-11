class Fundamental < ApplicationRecord
  belongs_to :stock
  validates :stock, presence: true
end
