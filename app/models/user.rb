class User < ActiveRecord::Base
  include Gravtastic
  gravtastic :rating => 'G', :size => 48, :secure => false
  
  def password
    @password
  end

  def password=(pass)
    return unless pass
    @password = pass
    generate_password(pass)
  end

  attr_accessor :password_confirmation
  attr_accessible :email, :hashed_password, :locale, :login, :salt

  validates :login, :email, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :login, :format => {:with => /\A\w+\z/, :message => 'only A-Z, a-z, _ allowed'}, :length => {:in => 3..20}
  validates :email, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}
  validates :password, :password_confirmation, :presence => true, :on => :create
  validates :password, :length => {:minimum => 6, :allow_nil => false}
  
  has_many :tweets
  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship", :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
 
  def self.authenticate(login,password)
    user = User.find_by_login(login)
    if user && Digest::SHA256.hexdigest(password + user.salt) == user.hashed_password
      return user
    end
    false
  end

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end
  
  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end
  
  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end

  private
  def generate_password(pass)
    salt = Array.new(10) { rand(1024).to_s(36) }.join
    self.salt, self.hashed_password = salt, Digest::SHA256.hexdigest(pass + salt)
  end
end
