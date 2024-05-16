# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

myUser = User.create(first_name: "Dev", last_name: "Isthebest", username: "dev", email: "d3@test.com", password: "123456")
myUser = User.find(1)
invest1 = Investment.create(name: "Netflix", quantity: 25, buy_price: 100)
invest2 = Investment.create(name: "Meta", quantity: 20, buy_price: 50)
invest3 = Investment.create(name: "Apple", quantity: 10, buy_price: 150)

invest = [invest1, invest2, invest3]
goal1 = Goal.create(name: "Safari", amount: 2000, notes: "Kenya is lit af")
goal2 = Goal.create(name: "House Deposit", amount: 20000, notes: "I hope this is enough")
goal3 = Goal.create(name: "bookcamp", amount: 10000, notes: "I hope this is enough")
goals = [goal1, goal2, goal3]

saving1 = Saving.create(name: "main", amount: 2000)
saving2 = Saving.create(name: "emergency fund", amount: 1000)
savings = [saving1, saving2]

myUser.goals = goals
myUser.investments = invest
myUser.savings = savings
