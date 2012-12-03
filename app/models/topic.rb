class Topic < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :vote_count
  
  belongs_to :user
  has_many :votes
  
  validates :name,:presence => true
  validates :description ,:presence => true
  
  scope :in_recent_order ,:order => "created_at desc"
  
 
  
end
