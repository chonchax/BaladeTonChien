class WalksController < ApplicationController
  def index
    @walk = Walk.all
  end

  def show
    @walk = Walk.find(params[:id])
  end
end
