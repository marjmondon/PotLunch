class DeleteTokensToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :tokens, :integer, default: 0
  end
end
