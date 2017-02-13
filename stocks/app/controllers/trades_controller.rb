class TradesController < ApplicationController
  before_action :load, only: :index

  def index
    render json: @trades
  end

  private

  def load
    @trades = Trade.by_symbol(symbol)
  end


  def symbol
    params.require(:symbol)
    params[:symbol]
  end
end
