class MessagesController < ApplicationController

  def create
    @room_message = Message.create dialog_id: params.dig(:message, :dialog_id),
                                   user_id: params.dig(:message, :user_id),
                                   content: params.dig(:message, :content)
    if @room_message.save
      ActionCable.server.broadcast 'room_channel',
                                    dialog_id: params.dig(:message, :dialog_id),
                                    user_id: params.dig(:message, :user_id),
                                    content: params.dig(:message, :content),
                                    initial: current_user.username[0].upcase
    end
  end

  protected

  private def message_params
    params.require(:message).permit(:dialog_id, :user_id, :content)
    @curent_user_id = params.dig(:message, :user_id);
  end

end
