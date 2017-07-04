class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    can :bid, Auction do |Auction|
      auction.user != user
    end

    cannot :bid, Auction do |Auction|
      auction.user == user
    end

  end
  
end
