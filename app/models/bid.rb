class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :user


  validates :bid, numericality: {greater_than: :auction_current_price, message: "must be higher than current price."}



  def auction_current_price
    self.auction.current_price
  end
end
