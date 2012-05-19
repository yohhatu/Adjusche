class AddNotifyDateToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :notify_date, :string
  end
end
