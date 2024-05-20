class CreateInvestments < ActiveRecord::Migration[7.1]
  def change
    create_table :investments do |t|
      t.string :name
      t.float :buy_price
      t.date :buy_date
      t.integer :quantity
      t.float :amount
      t.float :price_current
      t.jsonb :price_history, default: {}
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
