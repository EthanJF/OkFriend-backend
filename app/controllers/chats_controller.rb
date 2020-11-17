class ChatsController < ApplicationController

    def index
        chats = Chat.all
        render json: chats, include: [:user1, :user2, :messages => {include: :user}]
    end

    def show
        chat = Chat.find(params[:id])
        render json: chat, include: [:user1, :user2, :messages => {include: :user}]
    end

    def create
        chat = Chat.create(chat_params)
        render json: chat, include: [:user1, :user2, :messages]
    end

    def destroy
        chat = Chat.find(params[:id])
        chat.destroy
        render json: chat
    end

    private

    def chat_params
        params.require(:chat).permit(:user1_id, :user2_id)
    end

end
