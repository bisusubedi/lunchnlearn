class TopicsController < ApplicationController
  before_filter :authenticate_user!
 
  def index
    @topic = current_user.topics.build
    @topics = Topic.in_recent_order
   
  end

   # POST /topics 
  def create
    @topic = current_user.topics.build(params[:topic])
    if @topic.valid? && @topic.save
       redirect_to topics_url, notice: 'Topic was successfully created.'
     else
       redirect_to topics_url,alert: 'Please fill topic and highlights of your talk.' 
    end
   end 
   
   def vote
     @topic = Topic.find_by_id(params[:id])
     if current_user.has_voting_right?
        @vote = current_user.votes.build(:topic_id => @topic.id )
        @vote.save!
        flash[:notice] = "Your vote has been submitted." 
      else
         flash[:alert] = "Your have finished your voting limit." 
     end
     redirect_to topics_url
   end

end
