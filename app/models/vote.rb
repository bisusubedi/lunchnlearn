class Vote < ActiveRecord::Base
  after_save :increment_topic_vote_count
  belongs_to :topic
  validates :user_id, :uniqueness => {:scope => [:user_id, :topic_id]}

  def increment_topic_vote_count
    self.topic.vote_count += 1
    self.topic.save!
  end

end
