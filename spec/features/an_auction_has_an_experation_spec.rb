require 'rails_helper'

RSpec.feature "auction has an expiration" do
  scenario "auction's expire three days after creation" do

    auction = Auction.create(human_id: create(:human))
    expect((auction.expiration_date - auction.created_at).round).to eq (259200)
  end
end
