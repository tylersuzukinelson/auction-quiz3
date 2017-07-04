class UsersController < ApplicationController

  def index
  end

  def show
    @bids = Bid.where(user: current_user).order(created_at: :desc)
  end
end
