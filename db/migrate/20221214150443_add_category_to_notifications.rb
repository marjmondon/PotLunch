class AddCategoryToNotifications < ActiveRecord::Migration[7.0]
  def change
    Notification.destroy_all
    add_column :notifications, :category, :integer, null: false
  end
end
