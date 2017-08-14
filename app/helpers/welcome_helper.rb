module WelcomeHelper
	def find_coin(c)
		@coins.find { |x| x['name'] == "#{c.name}" }
	end

	def total_usd
		value_array = []
		@currencies.each do |c|
			value_array << (c.amount * find_coin(c)['price_usd'].to_f)
		end
		value_array.sum
	end

	def total_eth
		ethereum = @coins.find{ |x| x['name'] == 'Ethereum' }
		total_usd / ethereum['price_usd'].to_f
	end

	def total_btc
		bitcoin = @coins.find{ |x| x['name'] == 'Bitcoin' }
		total_usd / bitcoin['price_usd'].to_f
	end
end
