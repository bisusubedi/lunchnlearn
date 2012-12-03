class Vote < ActiveRecord::Base
  attr_accessible :topic_id, :user_id
  after_save :increment_topic_vote_count
  belongs_to :topic
  
  
   def increment_topic_vote_count
     self.topic.vote_count += 1
     self.topic.save!
  end
  
end
