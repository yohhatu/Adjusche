class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.integer :event_id
      t.integer :user_id
      t.date :candidate_date
      t.string :answer

      t.timestamps
    end
  end
end
