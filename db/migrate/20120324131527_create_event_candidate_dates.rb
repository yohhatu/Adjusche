class CreateEventCandidateDates < ActiveRecord::Migration
  def change
    create_table :event_candidate_dates do |t|
      t.integer :event_id
      t.date :candidate_date

      t.timestamps
    end
  end
end
