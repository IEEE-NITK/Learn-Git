require 'spec_helper'

describe UserController do

  before {controller.stub(:authenticate_user!).and_return true}

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.status.should be(200)
    end
  end

end
