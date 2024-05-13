class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :category
      t.float :amount

      t.timestamps
    end
  end
end
