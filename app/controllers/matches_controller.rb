class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
    @message = Message.new
    @messages = @match.messages.order(:created_at)
  end
end
