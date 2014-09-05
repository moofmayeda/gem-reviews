class JewelsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
    @jewels = Jewel.all
  end

  def show
    @jewel = Jewel.find(params[:id])
  end
end
