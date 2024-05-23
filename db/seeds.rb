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
  { title: "Money 101 for millennials", description: "Seven tips for improving your financial literacy. Financial literacy is rarely taught in school, and if families don't discuss credit scores, taxes and interest rates, millennials can easily get themselves into debt and other financial trouble.", url: "https://www.forbes.com/sites/forbesfinancecouncil/2018/03/28/money-101-for-millennials-seven-tips-for-improving-your-financial-literacy/" },
  { title: "Why is it important to invest early?", description: "Understand the importance of investing early and the power of compounding interest. This allows you to build a larger balance over time — even without extra capital investment.", url: "https://www.bankrate.com/investing/millennial-guide-to-investing/" },
  { title: "Invest with little money", description: "Six ways to invest with little money. You don't need to have a lump sum to start investing. Actually, investing small amounts of money regularly can be better than investing a large lump sum in one go. By investing a small amount of money each month you are relatively less vulnerable to market fluctuations.", url: "https://www.thetimes.co.uk/money-mentor/investing/investing-basics/invest-little-money" },
  { title: "Create a financial plan tailored to your goals", description: "These steps won't solve all your money problems, but they will help you develop the good habits that get you on the path to financial freedom. Simply making a plan with specific target amounts and dates reinforces your resolve to reach your goal and guards you against the temptation to overspend", url: "https://www.investopedia.com/articles/personal-finance/112015/these-10-habits-will-help-you-reach-financial-freedom.asp" },
  { title: "Understand how to create your Budget", description: "Creating a personalized budget makes it more likely that you'll be able to stick with it, and should mean you have fewer reasons to juggle money due to an unexpected expense. There are many methods of creating a budget, such as writing down how much you would ideally spend on each category and then adjusting the figures to make them fit into your income", url: "https://mumsmoney.com/budget-categories/" },
  { title: "Set a long term financial goal for yourself", description: "Whether you're looking to buy your own place, retire comfortably, or take a trip of a lifetime – setting long-term financial goals can help you succeed, having something to work towards can help you stay focused, become more mindful of your spending, and enable you to reach your goals.", url: "https://www.hsbc.co.uk/investments/how-to-set-long-term-financial-goals/" },
  { title: "How to retire early?", description: "Retiring in your thirties or forties might seem like a pipe dream, but that's the goal of some young workers who are following an extreme savings movement known as the Fire method. Even if you think some of the measures taken by Fire savers are a bit too much for you, adopting the general principles could shave years off your expected retirement age.", url: "https://www.thetimes.co.uk/money-mentor/pensions-retirement/private-pension/how-to-retire-early-the-fire-method" },
  { title: "What's your net worth?", description: "Why knowing your net worth is important. Your net worth provides a snapshot of your financial situation at this point in time., net worth is the difference between what you own and what you owe.", url: "https://www.investopedia.com/articles/pf/13/importance-of-knowing-your-net-worth.asp" },
  { title: "How To Get Out of Debt in 8 Steps", description: "Holding too much debt can cause financial hardship in several ways. You may struggle to pay your bills, or your credit score could suffer, making it more difficult to qualify for future loans like mortgages or auto loans. If you're carrying a significant amount of debt, you can take several steps to reduce it quickly and get on a healthy financial path.", url: "https://www.investopedia.com/personal-finance/digging-out-of-debt/" }
]

articles.each do |article|
  Article.create!(article)
end

myUser = User.create(first_name: "Dev", last_name: "Isthebest", username: "Dev the dev", email: "d3@test.com", password: "123456")
myUser = User.find(1)
invest1 = Investment.create(name: "ethereum", quantity: 1, buy_price: 1000, amount: 10)
invest2 = Investment.create(name: "dogecoin", quantity: 1000, buy_price: 0.05, amount: 1000)
invest = [invest1, invest2]

goal1 = Goal.create(name: "safari", amount: 2000, notes: "Cousin Mufasa said it would be amazing to see the lions on a safari!", date_by:  "Mon, 20 May 2024")
goal2 = Goal.create(name: "house deposit", amount: 20000, notes: "Current amount needed for a small flat in London zone 4.", date_by:  "Mon, 20 May 2024")
goal3 = Goal.create(name: "bootcamp", amount: 10000, notes: "Hopefully once I get this I can transition into a full stack web dev career path.", date_by:  "Mon, 20 May 2024")
goals = [goal1, goal2, goal3]

saving1 = Saving.create(name: "main", amount: 2000)
saving2 = Saving.create(name: "emergency fund", amount: 1000)
saving3 = Saving.create(name: "university", amount: 20000)
savings = [saving1, saving2, saving3]

income1 = Income.create(name: "primary", amount: 30000)
income2 = Income.create(name: "tutoring", amount: 10000)
income3 = Income.create(name: "freelance", amount: 5000)
incomes = [income1, income2, income3]

debt1 = Debt.create(name: "bank loan", amount: 5000)
debt2 = Debt.create(name: "car", amount: 12500)
debts = [debt1, debt2]

expense1 = Expense.create(name: "food", input_amount: 500)
expense2 = Expense.create(name: "eating out", input_amount: 40)
expense3 = Expense.create(name: "gas", input_amount: 60)
expense4 = Expense.create(name: "electricity", input_amount: 100)
expense5 = Expense.create(name: "rent", input_amount: 1000)
expense6 = Expense.create(name: "light bill", input_amount: 100)
expense7 = Expense.create(name: "broadband", input_amount: 60)
expense8 = Expense.create(name: "travel", input_amount: 130)
expense9 = Expense.create(name: "entertainment", input_amount: 100)
expenses = [expense1, expense2, expense3, expense4, expense5, expense6, expense6, expense7, expense8, expense9]


myUser.goals = goals
myUser.investments = invest
myUser.savings = savings
myUser.incomes = incomes
myUser.debts = debts
myUser.expenses = expenses
