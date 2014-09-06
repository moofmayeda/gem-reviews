class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @jewel = Jewel.find(params[:jewel_id])
    @review = @jewel.reviews.new
    respond_to do |format|
      format.js
    end
  end

private
  def review_params
    params.require(:review).permit(:title, :text)
  end
end
