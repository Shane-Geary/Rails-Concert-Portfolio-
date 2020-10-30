class TicketsController < ApplicationController
    before_action :not_logged_in

    def index 
        @tickets = Ticket.all 
    end

    def new 
        @ticket = Ticket.new 
    end

    def create 
        @ticket = current_user.tickets.build(ticket_params) 
        if @ticket.save  
            redirect_to tickets_path  
        else 
            render :new 
        end
    end

    private 

    def ticket_params 
        params.require(:ticket).permit(:name, :date, :artist) 
    end
end
