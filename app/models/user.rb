class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :username, presence: true
  has_many :goals, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_many :investments, dependent: :destroy
  has_many :debts, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :savings, dependent: :destroy

  after_create :initialize_defaults

  private

  def initialize_defaults
    create_default_investments
    create_default_goals
    create_default_savings
    create_default_incomes
    create_default_debts
    create_default_expenses
  end

  def create_default_investments
    self.investments.create(name: "ethereum", quantity: 1, buy_price: 1000, amount: 10)
    # self.investments.create(name: "dogecoin", quantity: 1000, buy_price: 0.05, amount: 1000)
  end

  def create_default_goals
    self.goals.create(name: "safari", amount: 2000, notes: "Cousin Mufasa said it would be amazing to see the lions on a safari!", date_by: "Mon, 20 May 2024")
    self.goals.create(name: "house deposit", amount: 20000, notes: "Current amount needed for a small flat in London zone 4.", date_by: "Mon, 20 May 2024")
    self.goals.create(name: "bootcamp", amount: 10000, notes: "Hopefully once I get this I can transition into a full stack web dev career path.", date_by: "Mon, 20 May 2024")
  end

  def create_default_savings
    self.savings.create(name: "main", amount: 2000)
    self.savings.create(name: "emergency fund", amount: 1000)
  end

  def create_default_incomes
    self.incomes.create(name: "primary", amount: 30000)
    self.incomes.create(name: "side hustle", amount: 5000)
  end

  def create_default_debts
    # Add default debts creation logic if necessary
  end

  def create_default_expenses
    expenses = [
      { name: "food", input_amount: 500 },
      { name: "eating out", input_amount: 40 },
      { name: "gas", input_amount: 60 },
      { name: "electricity", input_amount: 100 },
      { name: "rent", input_amount: 1000 },
      { name: "light bill", input_amount: 100 },
      { name: "broadband", input_amount: 60 },
      { name: "travel", input_amount: 130 },
      { name: "entertainment", input_amount: 100 }
    ]
    expenses.each do |expense|
      self.expenses.create(expense)
    end
  end
end
