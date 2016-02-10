FactoryGirl.define do

  factory :business do
    name
    description
    url
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

end
