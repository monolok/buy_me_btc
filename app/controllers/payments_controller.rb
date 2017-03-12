class PaymentsController < ApplicationController

  def index
  	flash[:kraken] = HTTParty.get("https://api.kraken.com/0/public/Ticker?pair=XXBTZEUR")["result"]["XXBTZEUR"]["c"][0]
  end

  def conversion
  	flash[:value] = params["value"].to_f
  	flash[:btc_to_get] = (flash[:value] / flash[:kraken].to_f).round(4)
  	redirect_to root_path
  end
  
end
