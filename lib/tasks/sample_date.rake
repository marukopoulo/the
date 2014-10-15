namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Yakumo Sugimoto",
                 email: "shota.419@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.jp"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

users = User.all.limit(3)
    50.times do
      content = Faker::Lorem.sentence(5)
      title = Faker::Company.catch_phrase

     users.each { |user| user.microposts.create!(content: content, title: title) }
    end
  end
end