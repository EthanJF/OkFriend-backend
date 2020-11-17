# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Interest.destroy_all
User.destroy_all

users = RestClient.get 'https://randomuser.me/api/?results=500'

zip_codes = RestClient.get 'https://zippopotam.us/us/ny/new%20york%20city'

parsed_users = JSON.parse(users)

parsed_zip_codes = JSON.parse(zip_codes)

resulting_users = parsed_users["results"]

resulting_zip_codes = parsed_zip_codes["places"]

parties_array = ["I don't go to parties.", "I'm always looking for a good time.", "I'm the center of attention.", 
            "I'm great at making new friends.", "I love to mingle.", "I'm a wallflower.","I tend to keep to myself.",
            "I prefer one-on-one interactions."]

resulting_users[0..49].each do |user|
    User.create(username: user["login"]["username"], email: user["email"], password: user["login"]["password"], 
    age: rand(25..45), gender: "non-binary", zip_code: resulting_zip_codes.sample["post code"], 
    parties: parties_array.sample, picture: user["picture"]["large"], about_me: Faker::Hipster.paragraph)
end

resulting_users[50..resulting_users.length].each do |user|
    User.create(username: user["login"]["username"], email: user["email"], password: user["login"]["password"], 
    age: rand(25..45), gender: user["gender"], zip_code: resulting_zip_codes.sample["post code"], 
    parties: parties_array.sample, picture: user["picture"]["large"], about_me: Faker::Hipster.paragraph)
end

interest_names = ["hiking", "reading", "video games", "writing", "coding", "sports", "weight lifting", "crafting", 
                "movies", "tv shows", "podcasts", "fitness", "politics", "biking", "skating", "cooking", "drinking",
                "ping pong", "computers", "fashion", "music", "food", "running", "veganism", "vegetarianism",
                "pets", "dogs", "cats", "books", "football", "baseball", "soccer", "beer", "knitting", "crocheting",
                "nature", "tattoos", "piercings", "guitar", "violin", "bass", "drums", "fishing", "kayaking", "boating",
                "science fiction", "fantasy", "literature", "singing", "karaoke", "baking", "board games", "dungeons and dragons",
                "magic the gathering", "activism", "social justice", "clubbing", "bars", "beach", "swimming", "acting"]

User.all.each do |each_user|
    interest_array = []
    10.times do
        new_interest = (interest_names - interest_array).sample
        Interest.create(name: new_interest, user: each_user)
        interest_array << new_interest
    end
end

puts "It's been seeded."

