class WelcomeController < ApplicationController
	before_action :testing

	def index
		@currencies = Currency.all
	end

	private
	def testing
		@coins = [{'id' => 'nimiq', 'name' => 'Nimiq', 'symbol' => 'NET', 'price_usd' => 0.59, 'market_cap_usd' => 6430400}, 
						{'id' => 'neo', 'name' => 'NEO', 'symbol' => 'NEO', 'price_usd' => 36.86, 'market_cap_usd' => 1136305000}, 
						{'id' => 'gas', 'name' => 'Gas', 'symbol' => 'GAS', 'price_usd' => 23.89, 'market_cap_usd' => 65443333}, 
						{'id' => 'ethereum', 'name' => 'Ethereum', 'symbol' => 'ETH', 'price_usd' => 300.70, 'market_cap_usd' => 26136300000}, 
						{'id' => 'bitcoin', 'name' => 'Bitcoin', 'symbol' => 'BTC', 'price_usd' => 4102.30, 'market_cap_usd' => 260165890000}, 
						{'id' => 'ripple', 'name' => 'Ripple', 'symbol' => 'XRP', 'price_usd' => 0.17, 'market_cap_usd' => 60168890000} ]
	end

	def fetch_api
		require 'open-uri'
		url = "https://api.coinmarketcap.com/v1/ticker"
		@coins = JSON.parse(open(url).read)
	end	
end
