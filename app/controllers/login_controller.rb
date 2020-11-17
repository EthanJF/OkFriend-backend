class LoginController < ApplicationController

    def create
        user = User.find_by("lower(username) = ?", params[:username].downcase)
        if user && user.authenticate(params[:password])
        render json: { token: token(user.id), user_id: user.id }
        else
        render json: { errors: [ "Your username or password is incorrect. Please try again." ] }, status: :unprocessable_entity
        end
    end

end
