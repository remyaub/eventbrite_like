class Event < ApplicationRecord
    
    belongs_to :admin, class_name: 'User'
    has_many :attendences
    has_many :attendees, through: :attendences

    # validates :start_date, presence: true
    # validates :start_date_in_future

    # validates :duration, presence: true
    # validates :duration_multiple_of_five

    # validates :title, presence: true, length: {minimum: 5, maximum: 140}
    # validates :description, presence: true, length: {in: 20..1000}

    # validates :price, presence: true


    # validates :location, presence: true

end


