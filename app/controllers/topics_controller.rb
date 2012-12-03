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

end
