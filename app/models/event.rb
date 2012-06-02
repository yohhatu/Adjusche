class Event < ActiveRecord::Base
  has_many :event_candidate_dates
end
