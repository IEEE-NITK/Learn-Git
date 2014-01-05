require 'spec_helper'

describe "Homes Controller" do
  describe "GET /" do
    it "get root page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
    end
  end

  describe "GET /home/dashboard" do 
  	it "should get dashboard page" do
  		get "/home/dashboard"
  		response.status.should be(200)
  	end
  end
end