class RemoveColumnToChatroom < ActiveRecord::Migration[7.0]
  def change
    remove_reference :chatrooms, :swap, foreign_key: true, index: false
  end
end
