class UserController < ApplicationController	
  before_filter :authenticate_user!

  def show
  end

  def dashboard
  	@courses = Course.all
  end
end
