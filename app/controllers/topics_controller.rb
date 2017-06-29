class TopicsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @topic = current_user.topics.build
    @topics = Topic.in_recent_order

  end

   # POST /topics
  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.valid? && @topic.save
       redirect_to topics_url, notice: 'Topic was successfully created.'
     else
       redirect_to topics_url,alert: "#{@topic.errors.full_messages.join(', ')}"
    end
   end

  def vote
    topic = Topic.find_by_id(params[:id])
    if topic.up_vote(current_user)
      flash[:notice] = "Your vote has been submitted."
    else
      flash[:alert] = "Your vote has already been submitted."
    end
    redirect_to topics_url
  end

   private
   def topic_params
     params.require(:topic).permit(:description, :name, :user_id, :vote_count)
   end
end
