class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @jewel = Jewel.find(params[:jewel_id])
    @review = @jewel.reviews.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @jewel = Jewel.find(params[:jewel_id])
    @review = @jewel.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      respond_to do |format|
        format.html { redirect_to jewel_path(@jewel)}
        format.js
      end
    else
      render 'new'
    end
  end

private
  def review_params
    params.require(:review).permit(:title, :text)
  end
end
