class JewelsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
    @jewels = Jewel.all
  end

  def show
    @jewel = Jewel.find(params[:id])
    @review = @jewel.reviews.new
  end

  def new
    @jewel = Jewel.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @jewel = Jewel.new(jewel_params)
    if @jewel.save
      respond_to do |format|
        format.html { redirect_to root_path}
        format.js
      end
    else
      render 'new'
    end
  end

  def edit
    @jewel = Jewel.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @jewel = Jewel.find(params[:id])
    if @jewel.update(jewel_params)
      respond_to do |format|
        format.html { redirect_to jewel_path(@jewel) }
        format.js
      end
    end
  end

  def destroy
    @jewel = Jewel.find(params[:id])
    @jewel.reviews.destroy_all
    @jewel.destroy
    redirect_to jewels_path
  end

private
  def jewel_params
    params.require(:jewel).permit(:name, :url)
  end
end
