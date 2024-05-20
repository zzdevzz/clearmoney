# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Article.delete_all

articles = [
  { title: "Money 101", description: "Financial Literacy Courses", url: "https://www.forbes.com/sites/forbesfinancecouncil/2018/03/28/money-101-for-millennials-seven-tips-for-improving-your-financial-literacy/" },
  { title: "Why is it important to invest early", description: "Understand the importance of investing early and the power of compounding interest", url: "https://www.bankrate.com/investing/millennial-guide-to-investing/" },
  { title: "Invest with little money", description: "Six ways to invest with little money", url: "https://www.thetimes.co.uk/money-mentor/investing/investing-basics/invest-little-money" },
  { title: "The significance of creating a financial plan tailored to individual goals and needs", description: "Financial planning, wealth building and financial independence", url: "https://www.investopedia.com/articles/personal-finance/112015/these-10-habits-will-help-you-reach-financial-freedom.asp" },
  { title: "Budgeting", description: "How to plan and cut cost to save money", url: "https://mumsmoney.com/budget-categories/" },
  { title: "Financial goals", description: "set a long term financial goal for yourself", url: "https://www.hsbc.co.uk/investments/how-to-set-long-term-financial-goals/" },
  { title: "Early retirement", description: "How to retire early: the Fire movement", url: "https://www.thetimes.co.uk/money-mentor/pensions-retirement/private-pension/how-to-retire-early-the-fire-method" },
  { title: "What's your net worth", description: "Why Knowing Your Net Worth Is Important", url: "https://www.investopedia.com/articles/pf/13/importance-of-knowing-your-net-worth.asp" },
  { title: "Get Out of Debt", description: "How To Get Out of Debt in 8 Steps", url: "https://www.investopedia.com/personal-finance/digging-out-of-debt/" },

]

articles.each do |article|
  Article.create!(article)
end

myUser = User.create(first_name: "Dev", last_name: "Isthebest", username: "dev", email: "d3@test.com", password: "123456")
myUser = User.find(1)
invest1 = Investment.create(name: "bitcoin", quantity: 0.2, buy_price: 10000)
invest2 = Investment.create(name: "dogecoin", quantity: 1000, buy_price: 0.05)
invest = [invest1, invest2]

goal1 = Goal.create(name: "Safari", amount: 2000, notes: "Kenya is lit af")
goal2 = Goal.create(name: "House Deposit", amount: 20000, notes: "I hope this is enough")
goal3 = Goal.create(name: "bookcamp", amount: 10000, notes: "I hope this is enough")
goals = [goal1, goal2, goal3]

saving1 = Saving.create(name: "main", amount: 2000)
saving2 = Saving.create(name: "emergency fund", amount: 1000)
saving3 = Saving.create(name: "university", amount: 20000)
savings = [saving1, saving2, saving3]

income1 = Income.create(name: "primary", amount: 30000)
income2 = Income.create(name: "OF", amount: 10000)
income3 = Income.create(name: "Freelance", amount: 5000)
incomes = [income1, income2, income3]

debt1 = Debt.create(name: "bank loan", amount: 5000)
debt2 = Debt.create(name: "car", amount: 12500)
debts = [debt1, debt2]

expense1 = Expense.create(name: "food", amount: 500)
expense2 = Expense.create(name: "light", amount: 40)
expense3 = Expense.create(name: "gas", amount: 60)
expense4 = Expense.create(name: "electricity", amount: 100)
expense5 = Expense.create(name: "rent", amount: 1000)
expense6 = Expense.create(name: "light bill", amount: 100)
expense7 = Expense.create(name: "broadband", amount: 60)
expense8 = Expense.create(name: "car", amount: 130)
expense9 = Expense.create(name: "bank loan", amount: 100)
expenses = [expense1, expense2, expense3, expense4, expense5, expense6, expense6, expense7, expense8, expense9]


myUser.goals = goals
myUser.investments = invest
myUser.savings = savings
myUser.incomes = incomes
myUser.debts = debts
myUser.expenses = expenses
