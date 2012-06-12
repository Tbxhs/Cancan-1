require 'spec_helper'

describe SessionsController do

	it "have been login" do
		post :create, :login => "Yoooooo",:password => "12345678"
		session[:user_id].should_not be_nil
	end

	it "can Not login" do
		post :create, :login => "XXXXXXX",:password => "12345678"
		session[:user_id].should be_nil
	end

	it "should have a correct password" do
		post :create, :login => "Yoooooo",:password => "678"
		session[:user_id].should be_nil
	end

end
