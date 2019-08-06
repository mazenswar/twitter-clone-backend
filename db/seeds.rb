# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def user(name)
    first_name = name.split(" ")[0]
    last_name = name.split(" ")[1]
    username = first_name + last_name
    {
        first_name: first_name,
        last_name:last_name,
        email: "#{first_name}@email.com",
        username: username.downcase!,
        password: "123"
    }
end

user_names = ["Rick Sanchez", "Morty Smith", "Homer Simpson", "Bart Simpson", "Lisa Simpson", "Peter Griffin", "Stewie Griffin", "Lois Griffin", "Marge Simpson", "Huey Freeman", "Riley Freeman", "Karl Marx", "Antonio Gramsci", "Franz Kafka", "Frantz Fanon", "Emma Goldman", "Albert Camus", "James Baldwin", "Edward Said", "Mikhail Bakunin", "Peter Kropotkin", "Errico Malatesta", "Noam Chomsky", "Friedrich Nietzsche"]

user_names.each do |n|
    user = User.create(user(n))
    50.times do
        Tweet.create(content: Faker::Quote.yoda, user: user)
    end
end




puts "Woooohoooo!"