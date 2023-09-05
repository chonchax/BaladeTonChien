class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
    @user = @match.users.reject { |user| user == current_user }.first
    @message = Message.new
    @messages = @match.messages.order(:created_at)
  end

  def index
    @matches = Match.all
  end
end
