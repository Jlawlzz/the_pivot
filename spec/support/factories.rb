FactoryGirl.define do

  factory :business do
    name
    description
    url
    status :inactive
  end

  sequence :name do |n|
    "#{n} Business"
  end

  sequence :description do |n|
    "#{n} Description"
  end

  sequence :url do |n|
    "#{n}_business"
  end

  factory :human do
    scum_name
    bio
  end

  sequence :scum_name do |n|
    "#{n}_scum_name"
  end

  sequence :bio do |n|
    "#{n}_bio"
  end

  factory :auction do
  end

  factory :user do
    first_name
    last_name
    username
    password "password"
  end

  sequence :first_name do |n|
    "#{n}First"
  end

  sequence :last_name do |n|
    "#{n}Last"
  end

  sequence :username do |n|
    "#{n}FirstLast"
  end
  #
  # factory :order do
  #   status "ordered"
  #   total_price 5000
  # end
  #
  # factory :order_item do
  #   item_quantity 1
  #   item_price 1000
  # end
end
