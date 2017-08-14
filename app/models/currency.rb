class Currency < ApplicationRecord
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :amount, numericality: true
end
