class AuctionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_auction, only: [:edit, :show, :update, :destroy]

  def index
    @auctions = Auction.order(created_at: :desc)
    # @auctions = Auction.where.not(aasm_state: 'draft').order(created_at: :desc)
  end

  def show
    @bid = Bid.new
    @bids = @auction.bids.order(created_at: :desc)
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to @auction, notice: 'Auction created.'
    else
      render :new, notice: 'Error creating auction.'
    end
  end

  def update
    if @auction.update aasm_state: params[:aasm_state]
      flash[:notice] = 'Published!'
    else
      flash[:alert] = @auction.errors.full_messages.join(', ')
    end
    redirect_to @auction
  end

  private

  def find_auction
    @auction = Auction.find params[:id]
  end

  def auction_params
    params.require(:auction).permit(:title, :details, :end_date, :reserve_price, :current_price)
  end

end
