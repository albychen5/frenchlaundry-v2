class ProfilesController < ApplicationController
	before_action :set_user, only: [:show, :edit]

  def show
  	@locations = User.find_by(user_name: params[:user_name])
  														.locations.order('created_at DESC')
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  private
  def set_user
  	@user = User.find_by(user_name: params[:user_name])
  end
end
