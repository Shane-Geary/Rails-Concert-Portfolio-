class VenuesController < ApplicationController

    def index 
        @venues = Venue.all 
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
            redirect_to venue_path(@venue)
        else
            render :edit
        end
    end
end
