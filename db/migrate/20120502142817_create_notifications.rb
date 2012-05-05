class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :notify_kind
      t.boolean :read_flag
      t.integer :general_column1
      t.integer :general_column2
      t.integer :general_column3

      t.timestamps
    end
  end
end
