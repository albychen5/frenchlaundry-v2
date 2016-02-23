class LocationsController < ApplicationController
	before_action :set_location, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		@locations = Location.all
	end

	def show
	end

	def new
		@location = current_user.locations.build
	end

	def edit
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
		if @location.update(location_params)
			flash[:success] = "Location updated!"
			redirect_to(location_path(@location))
		else
			flash[:alert] = "New location could not be updated"
			render :edit
		end
	end

	def destroy
		@location.destroy
		redirect_to locations_path
	end

	private
	def location_params
		params.require(:location).permit(:name, :address, :category, :phone_number)
	end

	def set_location
		@location = Location.find(params[:id])
	end

end