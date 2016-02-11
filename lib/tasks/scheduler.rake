desc "This task is called by the Heroku scheduler add-on"
task :update_auction => :environment do
  puts "Updating auctions..."
  Worker.update_auction
  puts "done."
end
