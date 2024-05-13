class CreateDebts < ActiveRecord::Migration[7.1]
  def change
    create_table :debts do |t|
      t.string :company_name
      t.float :amount
      t.float :interest
      t.string :notes
      t.date :pay_by

      t.timestamps
    end
  end
end
