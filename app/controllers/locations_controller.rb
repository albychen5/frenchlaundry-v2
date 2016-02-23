class LocationsController < ApplicationController
	before_action :authenticate_user!

	def index
		@locations = Location.all
	end

	def show
		@location = Location.find(params[:id])
	end

	def new
		@location = current_user.locations.build
	end

	def edit
		@location = Location.find(params[:id])
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

	def update
		@location = Location.find(params[:id])
		@location.update(location_params)
		redirect_to(location_path(@location))
	end

	def destroy
		@location = Location.find(params[:id])
		@location.destroy
		redirect_to locations_path
	end

	private
	def location_params
		params.require(:location).permit(:name, :address, :category, :phone_number)
	end

end