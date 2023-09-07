class MessagesController < ApplicationController
  def create
    @match = Match.find(params[:match_id])
    @message = Message.new(message_params)
    content = @message.content.scan(/(.*)(http\S*)(.*)/).first.map do |el|
      el.include?('http') ? "<a href=#{el}>#{el}</a>" : el
    end.join
    @message.content = content
    @message.match = @match
    @message.user = current_user
    if @message.save
      MatchChannel.broadcast_to(
        @match,
        { message: @message, user: current_user }
      )
      head :ok
    else
      render "matches/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
