class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :goals, dependent: :destroy
         has_many :incomes, dependent: :destroy
         has_many :investments, dependent: :destroy
         has_many :debts, dependent: :destroy
         has_many :expenses, dependent: :destroy
end
