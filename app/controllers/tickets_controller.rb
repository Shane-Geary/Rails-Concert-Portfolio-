class TicketsController < ApplicationController
    before_action :not_logged_in

    def index 
        if params[:venue_id] && @venue = Venue.find_by_id(params[:venue_id])
            @tickets = @venue.tickets 
        else 
            @tickets = current_user.tickets.all 
        end  
    end

    def new 
        if params[:venue_id] && @venue = Venue.find_by_id(params[:venue_id])
            @ticket = @venue.tickets.build 
        else
            flash[:message] = "Choose a Venue to add a Ticket to" if params[:venue_id]
            @ticket = Ticket.new 
        end 
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
        @ticket = Ticket.find(params[:id])
        @ticket.destroy 
        redirect_to tickets_path  
    end

    private 

    def ticket_params 
        params.require(:ticket).permit(:name, :date, :artist, :venue_id) 
    end
end
