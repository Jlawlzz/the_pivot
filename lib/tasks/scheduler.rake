desc "This task is called by the Heroku scheduler add-on"
task :update_auction => :environment do
  puts "Updating auctions..."
  Auction.update_auctions
  puts "done."
end
