class FriendshipsController < ApplicationController

    def index
        friendships = Friendship.all
        render json: friendships, include: [:user1, :user2]
    end

    def show
        friendship = Friendship.find(params[:id])
        render json: friendship, include: [:user1, :user2]
    end

    def create
        friendship = Friendship.create(friendship_params)
        render json: friendship, include: [:user1, :user2]
    end

    def destroy
        friendship = Friendship.find(params[:id])
        friendship.destroy
        render json: friendship
    end

    private

    def friendship_params
        params.require(:friendship).permit(:user1_id, :user2_id)
    end
end
