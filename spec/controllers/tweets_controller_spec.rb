require 'spec_helper'

describe TweetsController do

	before(:each) do
		post :create, :login => "Yoooooo",:password => "12345678"
	end
	
	it "should create a new tweet" do 
		post :create, :content => "This is a test tweet. "
	end

	after(:each) do
		post :destroy
	end

end
