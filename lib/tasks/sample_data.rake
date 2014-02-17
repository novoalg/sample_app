namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    make_users
    make_microposts
    make_relationships
  end

  def make_users
    admin = User.create!(:first_name => "Example",
                         :last_name => "User", 
                         :email => "example@railstutorial.org",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      first_name  = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:first_name => first_name,
                   :last_name => last_name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end

  end

  def make_microposts
    users = User.all(:limit => 6)
    50.times do
        content = Faker::Lorem.sentence(5)
        users.each { |user| user.microposts.create!(:content => content) }
    end
  end

  def make_relationships
      users = User.all
      user  = users.first
      followed_users = users[2..50]
      followers      = users[3..40]
      followed_users.each { |followed| user.follow!(followed) }
      followers.each      { |follower| follower.follow!(user) }
  end
end


