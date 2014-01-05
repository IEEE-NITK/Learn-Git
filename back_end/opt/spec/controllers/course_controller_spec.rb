require 'spec_helper'

describe CourseController do

  describe "GET 'index'" do
  	before { controller.stub(:authenticate_user).and_return true }
    it "returns http success" do
      get courses_path
      response.should be_success
    end
  end

end
