class TicketsController < ApplicationController
    before_action :not_logged_in

    def new 
        @ticket = Ticket.new 
    end
end
