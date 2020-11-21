class VenuesController < ApplicationController
    before_action :not_logged_in

    def index 
        @venues = current_user.venues.most_tickets
    end
    if params[:q]
        @venues = @venues.search(params[:q].downcase)
    end

    def new 
        @venue = Venue.new
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
        @venue = Venue.find(params[:id])
        @venue.destroy 
        redirect_to venues_path  
    end 

    private 

    def venue_params 
        params.require(:venue).permit(:name, :ticket_id) 
    end
end
