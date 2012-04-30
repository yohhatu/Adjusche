class AddConfirmedFlagToEventCandidateDate < ActiveRecord::Migration
  def change
    add_column :event_candidate_dates, :confirmed_flag, :boolean
  end
end
