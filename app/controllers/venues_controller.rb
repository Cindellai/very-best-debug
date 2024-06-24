class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venues/venue_list" })
  end

  def show
    venue_id = params.fetch("id")
    @the_venue = Venue.find(venue_id)

    render({ :template => "venues/details" })
  end

  def create
    @venue = Venue.new
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")
    
    if @venue.save
      redirect_to("/venues/#{@venue.id}")
    else
      render({ :template => "venues/venue_list" })
    end
  end
  
  def update
    the_id = params.fetch("id")
    @venue = Venue.find(the_id)
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")

    if @venue.save
      redirect_to("/venues/#{@venue.id}")
    else
      render({ :template => "venues/details" })
    end
  end

  def destroy
    the_id = params.fetch("id")
    @venue = Venue.find(the_id)
    @venue.destroy

    redirect_to("/venues")
  end
end
