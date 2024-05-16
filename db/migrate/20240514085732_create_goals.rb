class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.string :name
      t.float :amount
      t.string :notes
      t.date :date_by
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
