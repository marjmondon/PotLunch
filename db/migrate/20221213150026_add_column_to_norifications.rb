class AddColumnToNorifications < ActiveRecord::Migration[7.0]
  def change
    add_reference :notifications, :user, foreign_key: true
    add_column :notifications, :read, :boolean, default: false
  end
end
