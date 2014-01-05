require 'spec_helper'

describe "Homes Controller" do
  describe "GET /" do
    it "should get root page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
    end
  end

  describe "GET /dashboard" do 
  	it "should get dashboard page" do
  		get "/dashboard"
  		response.status.should be(200)
  	end
  end

  describe "User should be able to login when he enters username and password" do
  	let(:user) { FactoryGirl.create(:user) }

  	before {
	  	visit root_path
			user.save!
			fill_in "Email",        with: user.email
			fill_in "Password",     with: user.password
  	}

  	it "should login" do
			click_button "Sign in"
			current_path.should == authenticated_root_path
		end
  end

end