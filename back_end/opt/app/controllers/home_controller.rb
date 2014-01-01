require 'securerandom'
class HomeController < ApplicationController
before_filter :getNotifications

    def random_string
    	@str=SecureRandom.uuid()
    end

    def index
    end

    def dashboard

    end

private



end
