class ChatsController < ApplicationController
  def create
    group = Group.find(params[:group_id])
    chat = current_user.chats.new(chat_params)
    chat.group_id = group.id
    chat.save
    redirect_to chat_group_path(group)
  end

  def destroy
  end

  private

  def chat_params
    params.require(:chat).permit(:comment)
  end

end
