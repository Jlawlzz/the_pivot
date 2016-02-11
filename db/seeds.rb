class Seed

  def self.start
    seed = Seed.new
    seed.generate_users
    seed.generate_admin
    seed.generate_humans
    seed.generate_businesses
    seed.generate_auctions
    seed.generate_roles
  end

  def generate_roles
      Role.create(name: "registered_user")
      Role.create(name: "skynet")

      admin = User.create(
      first_name: "Mr",
      last_name: "Admin",
      username: "admin",
      password: "password",
      role: 1)
      business = Business.create(name:"admin business", description:"We do work")
      UserRole.create(role_id: Role.create(name: "business_admin").id, business_id: business.id, user_id: admin.id)
      admin.businesses << business
      puts "Admin created!"

      skynet = User.create(
      first_name: "Skynet",
      last_name: "Robot",
      username: "skynet",
      password: "password",
      role: 1
      )
      UserRole.create(business_id: business.id, role_id: Role.create(name: "skynet").id, user_id: skynet.id)
      skynet.businesses << business
      puts "Skynet created!"
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
    human_images = [
      "http://www.humansfordogs.com/wp-content/uploads/2010/03/6a00d8341c153053ef012876a0b6c5970c-pi.jpeg",
      "http://exit78.com/wp-content/uploads//2009/08/eyes_of_the_great_depression_035.jpg",
      "http://jugtones.com/images/blog/05.Old%20Photos/oldphotos01.jpg",
      "https://www.ssa.gov/history/pics/woman50.gif",
      "https://sfhassany.files.wordpress.com/2013/11/image2.jpg",
      "https://s-media-cache-ak0.pinimg.com/236x/6e/02/94/6e0294c209a5c2b176c35356a70dccc2.jpg",
      "http://i.imgur.com/LFEhi.jpg",
      "http://assets.makers.com/Barbara%20Working.png",
      "http://1.bp.blogspot.com/_RBWp1IAT0ZI/TAPRnHSPV7I/AAAAAAAAAiQ/Ryeltar7nGA/s1600/Mine+Tipple+Boy+West+Virginia+coal+mine+Photograph+by+Lewis+Hine+1908.png",
      "http://www.maierandmaierphotography.com/wp-content/uploads/2013/03/portrait-homeless-woman-in-varanasi-india1.jpg",
      "http://www.radioproject.org/wp-content/uploads/2010/12/4910show1.jpg"
    ]

    100.times do |i|
      human = Human.create!(
        scum_name: Faker::Name.first_name,
        bio: Faker::Lorem.sentence(10),
        url: human_images.sample
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

  def generate_auctions
    auction = 10.times do |i|
      auction = Auction.create!(
        human_id: random_human.id
      )
      puts "Auction #{i}: Human: #{auction.human.scum_name} created!"
    end
  end


  private

    def random_user
      User.offset(rand(User.count)).first
    end

    def random_human
      Human.offset(rand(Human.count)).first
    end

end

Seed.start
