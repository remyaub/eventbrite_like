class Attendence < ApplicationRecord
    after_create :event_send

    belongs_to :attendee, class_name: 'User'
    belongs_to :event

    def event_send
        EventMailer.event_email(self.attendee, self.event, self.event.admin).deliver_now
    end

end