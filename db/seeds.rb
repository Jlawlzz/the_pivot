class Seed

  def self.start
    seed = Seed.new
    seed.generate_users
    seed.generate_admin
    seed.generate_humans
    seed.generate_businesses
  end

  def generate_users
    50.times do |i|
      user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.user_name,
        password: "password"
      )
      puts "User #{i}: #{user.first_name} #{user.last_name} created!"
    end
  end

  def generate_admin
    User.create!(
      first_name: "Mr",
      last_name: "Admin",
      username: "admin",
      password: "password",
      role: 1
    )
    puts "Admin created!"
  end

  def generate_humans
    100.times do |i|
      human = Human.create!(
        scum_name: Faker::Name.first_name,
        bio: Faker::Lorem.sentence(10)
      )
      puts "Human #{i}: #{human.scum_name} created!"
    end
  end

  def generate_businesses
    business = 10.times do |i|
      business = Business.create!(name: Faker::Company.name)
      3.times do |i|
        business.users = [random_user, random_user, random_user]
      end
      puts "Business #{i}: #{business.name} created!"
    end
  end

  private

    def random_user
      User.offset(rand(Item.count)).first
    end

end

Seed.start


#
# travesty.items.create(
#   title: "Oil Spill",
#   description: "Our proud sponsor BP would be delighted to spill 5,000 gallons of the sweetest crude large oil rigs can pull from the depths of the Earth",
#   price: 1000,
#   image_url: "oil_barrel.jpg"
# )
#
# travesty.items.create(
#   title: "6 Pack Plastic Rings Ocean Dump",
#   description: "Great for hugging animals! 1,000 uncut beer can holders will be liberated into the Pacific Ocean Gyre",
#   price: 1500,
#   image_url: "turtle_ocean.jpg"
# )
#
# travesty.items.create(
#   title: "Hair-Dryer Ice Cap Melting Team",
#   description: "Oceanic salinity content too high? Sea level too low? A team of revlon-wielding ice-haters will happily go to town on the ice caps for you",
#   price: 2750,
#   image_url: "polar_icecap.jpg"
# )
#
# travesty.items.create(
#   title: "Chemical Plant Arson",
#   description: "Did you find the Runxing Chemical Co. explosion video worth watching repeatedly? Recreate the experience with our experienced arson team!",
#   price: 3500,
#   image_url: "chemical_explosion.jpg"
# )
#
# travesty.items.create(
#   title: "Oceanic Deoxygenation",
#   description: "Algae blooms are like grass plains of the sea!",
#   price: 4250,
#   image_url: "baltic_bloom.jpg"
# )
#
# travesty.items.create(
#   title: "Coal Ash Liberation Event",
#   description: "If your nearby countryside is too colorful and splendid, we can cover it all in a thick coating of ash, filled wiith delightful mercury and lead. The kid's will love it",
#   price: 6800,
#   image_url: "coal_ash_spill.jpg"
# )
#
# travesty_2 = Travesty.create(
#   title: "Endangered Species Culling",
#   sponsor_image: "cecil_killer.jpg",
#   sponsor_title: "Walter Palmer"
# )
#
# travesty_2.items.create(
#   title: "Black Rhino Elimination Privilege",
#   description: "Feel free to take down a friendly rhino! Mother not included.",
#   price: 20000,
#   image_url: "rhino_black.jpg"
# )
#
# travesty_2.items.create(
#   title: "Amur Leopard Reduction Authorization",
#   description: "These pesky kitties are so close to extinction, you might as well push their numbers over the edge",
#   price: 30000,
#   image_url: "amur_leopard.jpg"
# )
#
# travesty_2.items.create(
#   title: "Bowhead Whale Minimization Opportunity",
#   description: "Enough fat can be harvested to light 10 million candles for years on end",
#   price: 22500,
#   image_url: "whale_hunting.jpg"
# )
#
# travesty_2.items.create(
#   title: "Cross River Gorilla Thinning Prerogative",
#   description: "There's only space enough on this planet for one big Ape. Do your part to ensure our species' success",
#   price: 27500,
#   image_url: "gorilla.jpg"
# )
#
# travesty_2.items.create(
#   title: "Hawksbill Turtle Eradication Entitlement",
#   description: "Tired of cleaning up turtle egg-shell litter from your nearest beach? Solve the problem before it starts!",
#   price: 15000,
#   image_url: "turtle_ocean.jpg"
# )
#
# travesty_2.items.create(
#   title: "St. John's River Manatee Extermination Charter",
#   description: "Maybe Sea Cows are as tasty as real cows! Try one today!",
#   price: 10000,
#   image_url: "manatee.jpg"
# )
#
# travesty_3 = Travesty.create(
#   title: "Crimes Against Humanity",
#   sponsor_image: "holding_hands.jpg",
#   sponsor_title: "Nestle"
# )
#
# travesty_3.items.create(
#   title: "Punk Your Enemy",
#   description: "Punkings aren't just fun and games...they can really make someone's like miserable.",
#   price: 450,
#   image_url: "egg_on_car.png"
# )
#
# travesty_3.items.create(
#   title: "Arsenic in Communal Water Source",
#   description: "Water is a hot spot for spreading disaster. Some of the world's most notable epidemics have used this fact to their advantage, and you can too.",
#   price: 1000,
#   image_url: "drinking_fountain.jpg"
# )
#
# travesty_3.items.create(
#   title: "Wreck Something Special",
#   description: "Nothing brings you joy like taking away things that bring joy to other people. Make it permanent with a wrecking crew today.",
#   price: 3000,
#   image_url: "wrecking_crew.jpg"
# )
#
# travesty_3.items.create(
#   title: "Release Used Needles in Playgrounds",
#   description: "When kids are coddled, they grow into the softy liberals that are ruining our country. Help toughen up our youngsters with some real-life temptation.",
#   price: 1150,
#   image_url: "needles.jpg"
# )
#
# travesty_3.items.create(
#   title: "Out Someone in Witness Protection",
#   description: "No one likes a snitch. We deliver the true justice.",
#   price: 4500,
#   image_url: "witness_protection.jpg"
# )
#
# travesty_3.items.create(
#   title: "Claim Your Bounty",
#   description: "Dog can help claim what's yours. And if the guy standing between him and your bounty gets in the way, well...that's on him.",
#   price: 7000,
#   image_url: "dog_bounty_hunter.jpg"
# )
#
# travesty_4 = Travesty.create(
#   title: "Touching Greatness",
#   sponsor_image: "holding_hands.jpg",
#   sponsor_title: "Bill Cosby"
# )
#
# travesty_4.items.create(
#   title: "Bill Cosby Defense Fund",
#   description: "We all know the feeling of being misunderstood. This is the time when friends matter, when YOU matter. Don't let a man down.",
#   price: 200,
#   image_url: "bill_cosby.gif"
# )
#
# travesty_4.items.create(
#   title: "El Chapo Tunnel Building Program",
#   description: "Contribute to returning one of the greatest Columbian businessmen to the freedom to puruse his calling.",
#   price: 1000,
#   image_url: "el_chapo.jpg"
# )
#
# travesty_4.items.create(
#   title: "Sponsor Donald Trump's Freedom Kids",
#   description: "Stars, stripes, and lots of xenophobia.",
#   price: 500,
#   image_url: "freedom_kids.jpg"
# )
#
# travesty_4.items.create(
#   title: "Romantic Evening with Charlie Sheen",
#   description: "Treat your lady to a night with one of Hollywood's most gracious, fun-loving, and sometimes-a-little-rowdy hosts.",
#   price: 4000,
#   image_url: "charlie_sheen.jpg"
# )
#
# travesty_4.items.create(
#   title: "George Zimmerman Ghost Tweeter",
#   description: "Do you struggle to draw attention to your Tweets. With Zimmerman ghost-writing for you, you'll have the love you deserve in no time.",
#   price: 800,
#   image_url: "george_zimmerman.jpg"
# )
#
# travesty_4.items.create(
#   title: "Sunday Brunch with Nancy Grace",
#   description: "You'll have the time of your life, if you can get a word in.",
#   price: 1500,
#   image_url: "nancy_grace.jpg"
# )
