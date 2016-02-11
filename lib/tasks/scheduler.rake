desc "This task is called by the Heroku scheduler add-on"
task :update_auction => :environment do
  puts "Updating auctions..."
  Auction.where(status: 'live').each do |auction|
    if (auction.time_left < 0) && (auction.user)
      Auction.where(status: 'live').each do |auction|
        assign_winner_of(auction) if auction.time_left < 0
      end
  end
  puts "done."
end
