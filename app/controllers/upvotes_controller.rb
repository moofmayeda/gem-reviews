class UpvotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @review = Review.find(params[:id])
    @upvote = @review.upvotes.create(user_id: current_user.id)
    # if @upvote.save
      # respond_to do |format|
      #   format.js
      # end
    # end
    redirect_to jewel_path(@review.jewel)
  end
end
