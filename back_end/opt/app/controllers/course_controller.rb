class CourseController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@courses = Course.all
  end

  def show

  end

end
