class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.date       :date,                null: false
      t.integer    :expense_category_id, null: false
      t.integer    :payment_method_id,   null: false
      t.integer    :price,               null: false
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
