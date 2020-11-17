class InterestsController < ApplicationController
  def index
    interests = Interest.all
    render json: interests
  end

  def show
    interest = Interest.find(params[:id])
    render json: interest
  end

  def create
    interest = Interest.create(interest_params)
    render json: interest
  end

  def destroy
    interest = Interest.find(params[:id])
      interest.destroy
      render json: interest
  end


  private

  def interest_params
      params.require(:interest).permit(:name, :user_id)
  end

end
