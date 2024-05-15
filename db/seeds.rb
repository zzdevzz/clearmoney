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
  { title: "Financial Literacy Courses", description: "Money 101", url: "https://www.forbes.com/sites/forbesfinancecouncil/2018/03/28/money-101-for-millennials-seven-tips-for-improving-your-financial-literacy/" },
  { title: "Why is it important to invest early", description: "Understand the importance of investing early and the power of compounding interest", url: "https://www.bankrate.com/investing/millennial-guide-to-investing/" },
  { title: "The significance of creating a financial plan tailored to individual goals and needs", description: "Financial planning, wealth building and financial independence", url: "https://wealthnation.io/blog/financial-planning-for-millennials/" },
]

articles.each do |article|
  Article.create!(article)
end
