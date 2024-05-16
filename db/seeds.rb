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
  { title: "Invest with littl money", description: "Six ways to invest with little money", url: "https://www.thetimes.co.uk/money-mentor/investing/investing-basics/invest-little-money" },
  { title: "The significance of creating a financial plan tailored to individual goals and needs", description: "Financial planning, wealth building and financial independence", url: "https://www.investopedia.com/articles/personal-finance/112015/these-10-habits-will-help-you-reach-financial-freedom.asp" },
  { title: "Budgeting", description: "How to plan and cut cost to save money", url: "https://mumsmoney.com/budget-categories/" },
  { title: "Financial goals", description: "set a long term financial goal for yourself", url: "https://www.hsbc.co.uk/investments/how-to-set-long-term-financial-goals/" },
  { title: "Early retirement", description: "How to retire early: the Fire movement", url: "https://www.thetimes.co.uk/money-mentor/pensions-retirement/private-pension/how-to-retire-early-the-fire-method" },
  { title: "What's ypur net worth", description: "Why Knowing Your Net Worth Is Important", url: "https://www.investopedia.com/articles/pf/13/importance-of-knowing-your-net-worth.asp" },
  { title: "Get Out of Debt", description: "How To Get Out of Debt in 8 Steps", url: "https://www.investopedia.com/personal-finance/digging-out-of-debt/" },

]

articles.each do |article|
  Article.create!(article)
end
