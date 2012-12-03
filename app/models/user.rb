class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  validates :full_name ,:presence => true 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:full_name
  # attr_accessible :title, :body
  
  has_many :topics
  has_many :votes
  
  def total_votes
    self.votes.count
  end
  
  def has_voting_right?
    self.total_votes < 4 
  end
    
    
end
