class PaymentsController < ApplicationController

  def index
  	flash[:kraken] = HTTParty.get("https://api.kraken.com/0/public/Ticker?pair=XXBTZEUR")["result"]["XXBTZEUR"]["c"][0].to_f.round(2)
  end

  def conversion
  	flash[:value] = params["value"].to_f
  	flash[:processing_fees] = (flash[:value] * 0.05).round(2)
  	flash[:monolok_fees] = (flash[:value] * 0.1).round(2)
  	flash[:net_value] = flash[:value] - flash[:processing_fees] - flash[:monolok_fees]
  	flash[:btc_to_get] = (flash[:net_value] / flash[:kraken].to_f).round(4)

  	redirect_to root_path
  end
  
end
