class LocationsController < ApplicationController
	before_action :authenticate_user!

	def index
		@locations = Location.all
	end

	def new
		@location = current_user.locations.build
	end

	def create
		@location = current_user.locations.build(location_params)

		if @location.save
			flash[:success] = "Location added!"
			redirect_to locations_path
		else
			flash[:alert] = "New location could not be created"
			render :new
		end
	end

	private
	def location_params
		params.require(:location).permit(:name, :address, :category, :phone_number)
	end

end