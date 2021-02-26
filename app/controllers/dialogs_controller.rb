class DialogsController < ApplicationController

  def index
    @dialogs = Dialog.all
  end

  def new
    @users = User.all
    @dialogs = Dialog.all
  end

  def show
    @users = User.all
    @dialogs = Dialog.all
    @current_dialog = Dialog.find(params[:id]) if params[:id]
    @message = Message.new dialog_id: @current_dialog.id, user_id: current_user.id
    @messages = Message.all
  end

  def create
    # render plain: params[:dialog].inspect
    @dialog = Dialog.new(dialog_params)
    @dialog.save
    redirect_to @dialog
  end

  private def dialog_params
    params.require(:dialog).permit(:dialog_first_user_id, :dialog_second_user_id)
  end

end
