class AddCoinToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :coins, :integer, default: 0
  end
end
