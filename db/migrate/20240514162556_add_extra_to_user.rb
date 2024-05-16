class AddExtraToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pension_contribution, :float
    add_column :users, :yearly_bonus, :float
  end
end
