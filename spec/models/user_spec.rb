require 'spec_helper'

describe User do
  
  before(:each) do
  	@user = User.new(:login => "Yoooooo", :email => "Yoooooo@163.com", :locale => "beijing")
  	@user.password= "12345678"
  	@user.password_confirmation = "12345678"
  end

  it "should require a login " do
  	@user.login = nil
  	user_no_login = @user.save
  	user_no_login.should be_false
  end

  it "can NOT reg one user again" do
    @user.save.should be_false
  end

  it "should accept valid email addresses" do
    @user.login = "Moooooo"
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      @user.email = address     
      @user.save.should be_true
    end
  end

  it "should reject duplicate email addresses" do
    @user.email = "Yoooooo@163.com"
    @user.save.should be_false
  end

  describe "password validations" do

    it "should require a long password" do
      @user.password = "123"
      @user.save.should be_false
    end

  end


  after(:each) do
  	#@user.delete
  end

end

