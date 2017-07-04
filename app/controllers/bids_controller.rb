class BidsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bids = Bid.where(user: current_user)
  end

  def create
    @auction = Auction.find params[:auction_id]
    @bid = Bid.new bid_params
    @bid.user = current_user
    @bid.auction = @auction
    if @bid.save
      if @bid.bid > @auction.reserve_price
        @auction.meet
      else
        @auction.not_met
      end
      @auction.current_price = @bid.bid
      @auction.save
      redirect_to @auction, notice: 'Bid created.'
    else
      redirect_to @auction, alert: @bid.errors.full_messages.join(', ')
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:bid)
  end

end
