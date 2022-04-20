class Ride < ApplicationRecord
    belongs_to :user 
    belongs_to :attraction

    def tall_enough?
        user.height >= attraction.min_height
    end

    def enough_tickets?
        user.tickets >= attraction.tickets
    end

    def take_ride
        if tall_enough? && enough_tickets?
            start_ride
            "Thanks for riding the #{attraction.name}!"
        elsif
            !tall_enough? && enough_tickets?
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif
            tall_enough? && !enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        else
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        end
    end

    def subtract_tickets
        new_ticket_num = user.tickets - attraction.tickets
        user.tickets = new_ticket_num
        user.save
    end

    def update_mood
        user.happiness = user.happiness + attraction.happiness_rating
        user.nausea = user.nausea + attraction.nausea_rating
        user.save
    end

    def start_ride
        subtract_tickets
        update_mood
    end

end

