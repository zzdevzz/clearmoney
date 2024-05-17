class AddUserToDebts < ActiveRecord::Migration[7.1]
  def change
    add_reference :debts, :user, null: false, foreign_key: true
  end
end
