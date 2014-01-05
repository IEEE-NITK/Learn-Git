require 'spec_helper'

describe User do
  before {@user = User.new(name: "user1" , email: "user1@email.com" , password: "foobar12345" , password: "foobar12345")}

  subject {@user}

  it {should respond_to(:email)}
  it {should respond_to(:name)}

  it {should be_valid}

  describe "When email is not there It should be invalid" do
  	before {@user.email = ""}

  	it {should_not be_valid}
  end

  describe "When password and password confirmation donot match, it should be invalid" do

  	before {@user.password_confirmation= "1234"}

  	it {should_not be_valid}

  end

  describe "When username is too long it should be invalid" do 
    before {@user.name = "a"*100}

    it {should_not be_valid}

  end

  pending "Check for uniqueness of the email id"

  pending "Check most cases of email being valid or not"
  #Check for uniqueness of the email id 
  #Check for the email id's being valid


end
