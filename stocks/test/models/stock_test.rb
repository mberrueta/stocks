require 'test_helper'

class StockTest < ActiveSupport::TestCase
  test 'should not save stock without symbol' do
    s = Stock.new
    assert_not s.save, 'Saved the Stock without a symbol'
  end
end
