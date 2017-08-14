class CurrenciesController < ApplicationController
	before_action :fetch_coins, only: [:new, :create, :edit, :update]

	def index
		@currencies = Currency.all
	end

	def new
		@currency = Currency.new
	end

	def create
		@currency = Currency.new(currencies_params)
		if @currency.save
			redirect_to root_url
		else
			render :new
		end
	end

	def edit
		@currency = Currency.find(params[:id])
	end

	def update
		@currency = Currency.find(params[:id])
		if @currency.update_attributes(currencies_params)
			redirect_to root_url
		else
			render :edit
		end
	end

	def destroy
		@currency = Currency.find(params[:id])
		@currency.destroy
		redirect_to root_url
	end

	private
	def currencies_params
		params.require(:currency).permit(:name, :amount)
	end

	def fetch_coins
		require 'open-uri'
		url = "https://api.coinmarketcap.com/v1/ticker/"
		@coins = JSON.parse(open(url).read)
	end
end