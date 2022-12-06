class CreateSwaps < ActiveRecord::Migration[7.0]
  def change
    create_table :swaps do |t|
      t.integer :status, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :lunch, null: false, foreign_key: true
      t.date :delivery_date

      t.timestamps
    end
  end
end
