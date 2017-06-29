class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  validates :name,:presence => true, :uniqueness => true
  validates :description ,:presence => true

  scope :in_recent_order, -> { order("created_at desc") }

  def up_vote(user)
    new_vote = self.votes.build(:user_id => user.id)
    new_vote.save
  end


end
