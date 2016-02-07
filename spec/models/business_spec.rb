require 'rails_helper'

RSpec.describe Business, type: :model do
  it "converts name into url" do
    business = Business.create(name: "business 1", description: "It sells stuff")

    expect("business-1").to eq(business.url)
  end
end
