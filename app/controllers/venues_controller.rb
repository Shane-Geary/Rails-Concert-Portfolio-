class VenuesController < ApplicationController
    before_action :not_logged_in

    def index 
        if params[:ticket_id] && @ticket = Ticket.find_by_id(params[:ticket_id])
            @venues = @ticket.venues 
        else
            @error = "That Ticket doesn't exist" if params[:ticket_id]
        @venues = Venue.all 
        end 
    end

    def new 
        if params[:ticket_id] && @ticket = Ticket.find_by_id(params[:ticket_id]) 
            @venue = @ticket.venues.build 
        else
            @error = "Choose a Ticket to add the Venue to" if params[:ticket_id]
        @venue = Venue.new 
        end 
    end

    def create 
        @venue = current_user.venues.build(venue_params) 
        if @venue.save  
            redirect_to venues_path  
        else 
            render :new 
        end
    end

    def show 
        @venue = Venue.find_by(id: params[:id])
    end

    def edit 
        @venue = Venue.find_by(id: params[:id])
    end

    def update 
        @venue = Venue.find_by(id: params[:id])
        if @venue.update(venue_params)
            redirect_to venues_path
        else
            render :edit
        end
    end

    def destroy 
        Venue.delete(params[:id]) 
        redirect_to venues_path 
    end

    def venue_params 
        params.require(:venue).permit(:name, :ticket_id) 
    end
end
