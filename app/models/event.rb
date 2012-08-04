class Event < ActiveRecord::Base
  has_many :event_candidate_dates

  ### event新規登録メソッド
  def Event.event_create event_params, str_candidate_date
    logger.debug("Create start #{event_params["name"]}")
    begin
      Event.transaction do
        @event = Event.create(event_params)

        ary_candidate_date = str_candidate_date.split("\r\n")
        ary_candidate_date.each{ |date| 
          @event_candidate_date = EventCandidateDate.create(:event_id => @event.id,:candidate_date => date, :confirmed_flag => false)
        }
      end
    logger.debug("Create done")
    rescue => e
    logger.debug("Create Error #{e.message}")
    end

    return @event
  end
end
