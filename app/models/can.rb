class Can < ActiveRecord::Base
  attr_accessible :address, :diecription, :hot, :locale, :name, :price, :rate, :telephone

  has_many :tweets
  
end
