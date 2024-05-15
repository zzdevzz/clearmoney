# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

myUser = User.find(1)
income1 = Income.create(name: "primary", amount: 25000)
income2 = Income.create(name: "OF", amount: 25000)

# income = [income1, income2]
goal1 = Goal.create(title: "Safari", amount: 2000, notes: "Kenya is lit af")
goal2 = Goal.create(title: "House Deposit", amount: 20000, notes: "I hope this is enough")
goal3 = Goal.create(title: "bookcamp", amount: 10000, notes: "I hope this is enough")
goals = [goal1, goal2, goal3]

myUser.goals = goals
