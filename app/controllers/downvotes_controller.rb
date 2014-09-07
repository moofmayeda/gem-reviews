class DownvotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @review = Review.find(params[:id])
    @downvote = @review.downvotes.new(user_id: current_user.id)
    if @downvote.save
      respond_to do |format|
        format.html { redirect_to jewel_path(@review.jewel) }
        format.js
      end
    end
  end
end
