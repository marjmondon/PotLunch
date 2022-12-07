class AddColumnToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :swap, foreign_key: true
  end
end
