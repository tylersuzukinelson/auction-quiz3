Bid.destroy_all
Auction.destroy_all
User.destroy_all

User.create(name: 'Johnnnn', email: '123@123.com', password: '123')

4.times do
  n = Faker::Name.name
  User.create(name: n,
              email: Faker::Internet.email(n),
              password: '123'
              )
end
listers = User.all
puts "#{User.count} users(listers) created."

 20.times do
   Auction.create(title: Faker::Hipster.sentence,
                  details: Faker::Hipster.paragraph,
                  end_date: Date.today + rand(100),
                  reserve_price: 100 + rand(900),
                  current_price: 50,
                  user_id: listers.sample.id,
                  aasm_state: 'published'
                  )
end
auctions = Auction.all
puts "#{Auction.count} auctions created."

10.times do
  n = Faker::Name.name
  User.create(name: n,
              email: Faker::Internet.email(n),
              password: '123'
              )
end
bidders = User.all
puts "#{User.count} users(bidders) created."

auctions.each do |a|
  rand(3..7).times do
    bid = a.current_price + rand(500)
    Bid.create(bid: bid,
               auction: a,
               user: bidders.sample
               )
    a.current_price = bid
    a.save
  end
end
bids = Bid.all
puts "#{Bid.count} bids created."
