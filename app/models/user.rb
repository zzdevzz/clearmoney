class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :amount, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  has_many :goals, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_many :investments, dependent: :destroy
  has_many :debts, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :savings, dependent: :destroy
end
