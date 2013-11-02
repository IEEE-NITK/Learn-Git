require 'securerandom'
class HomeController < ApplicationController

	def random_string
		@str=SecureRandom.uuid()
	end
end
