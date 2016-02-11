desc "This task is called by the Heroku scheduler add-on"
task :update_auction => :environment do
  puts "Updating auctions..."
  Auction.where(status: 'live').each do |auction|
    binding.pry
    if ((auction.time_left < 0) && (auction.user))
      binding.pry
        auction.assign_winner_of(auction)
    end
  end
  puts "done."
end
