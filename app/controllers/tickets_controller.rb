class TicketsController < ApplicationController
    before_action :not_logged_in

    def index 
        # if current_user.ticket_id = params[:user_id] 
        @tickets = Ticket.all 
        # end 
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

    def edit 
        @ticket = Ticket.find_by(id: params[:id])
    end

    def update 
        @ticket = Ticket.find_by(id: params[:id])
        if @ticket.update(ticket_params)
            redirect_to tickets_path
        else
            render :edit
        end
    end

    def destroy 
        Ticket.delete(params[:id]) 
        redirect_to tickets_path  
    end

    private 

    def ticket_params 
        params.require(:ticket).permit(:name, :date, :artist, :venue_id) 
    end
end
