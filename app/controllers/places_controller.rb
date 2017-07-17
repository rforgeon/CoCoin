class PlacesController < ApplicationController


  before_action :require_sign_in


  def index
    @my_places = current_user.places
  end

  def show
    @place = Place.find(params[:id])
    @member_count = UserGroup.where(:place_id [params[:id]]).size
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    current_user.places << @place

     if @place.save
       redirect_to @place, notice: "Place was saved successfully."
     else
       flash.now[:alert] = "Error creating place. Please try again."
       render :new
     end
   end

   def edit
     @place = Place.find(params[:id])
   end

   def update
     @place = Place.find(params[:id])

     @place.assign_attributes(place_params)

     if @place.save
        flash[:notice] = "Place was updated."
       redirect_to @place
     else
       flash.now[:alert] = "Error saving place. Please try again."
       render :edit
     end
   end

   def leave
    @place = Place.find(params[:place_id])

    @user_group = UserGroup.where('place_id=? AND user_id=?',@place.id, current_user.id)


    if @user_group.destroy_all
     flash[:notice] = "You have left the group: \"#{@place.name}\"."
     redirect_to places_path
   else
     flash.now[:alert] = "There was an error leaving the group: \"#{@place.name}\"."
     render :show
   end
   end

   def destroy
     @place = Place.find(params[:id])

     if @place.destroy
       flash[:notice] = "\"#{@place.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the place."
       render :show
     end
   end

   private

   def place_params
     params.require(:place).permit(:name, :link, :description)
   end

end
