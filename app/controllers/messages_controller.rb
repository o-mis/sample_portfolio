class MessagesController < ApplicationController
  def create
    @chef = Chef.find(params[:chef_id])
    @message = @chef.messages.build(comment_params)
    @message.user_id = current_user.id
    @message.save
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end

  private

  def comment_params
    params.require(:message).permit(:content, :chef_id, :user_id)
  end
end
