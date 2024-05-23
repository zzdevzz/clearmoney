class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :category
      t.float :input_amount
      t.float :amount
      t.boolean :occurs_monthly, default: true

      t.timestamps
    end
  end
end
