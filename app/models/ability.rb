class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    can :post, Auction do |auction|
      auction.user == user
    end

    can :bid, Auction do |auction|
      auction.user != user
    end

    cannot :bid, Auction do |auction|
      auction.user == user
    end

  end

end
