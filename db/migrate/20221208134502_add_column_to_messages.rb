class AddColumnToMessages < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :swap, foreign_key: true
    remove_reference :messages, :chatroom, foreign_key: true, index: false
  end
end
