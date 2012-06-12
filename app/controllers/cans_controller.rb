class CansController < ApplicationController
	def new
		@can = Can.new
	end

	def nearby
		
	end

	def create
		@can = Can.new params[:can]
		@can.save
	end

	def show
		@can = Can.find params[:id]	
	end	

end
