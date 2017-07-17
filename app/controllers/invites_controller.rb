class InvitesController < ApplicationController

  before_action :require_sign_in

  def index
    @invites = Invite.where("email=?", current_user.email)
  end

  def new
    @place = Place.find(params[:place_id])
    @user_group = UserGroup.where(place_id: [@place.id])
    @invite = Invite.new
  end



  def create
    @place = Place.find(params[:place_id])
    @invite = Invite.new(invite_params)
    # emails = params[:invite_emails].split(', ')
    # emails.each do |email|
      @invite.sender_id = current_user.id
      @user_group = UserGroup.where(place_id: [@place.id])
      @invite.place_id = @place.id

      if @invite.save

        #if the user already exists
        if @invite.recipient != nil

            #check if the user is already apart of the UserGroup
            if @user_group = UserGroup.where('place_id=? AND user_id=?',@place.id, current_user.id) != nil
              flash[:warning] = "#{@invite.recipient.name} is already in this group."
              redirect_to @place

            else

             #send a notification email
             InviteMailer.existing_user_invite(@invite,@place).deliver


             flash[:notice] = "Invitation was sent!."
             redirect_to @place
           end
          #user does not exist
          else
             InviteMailer.new_user_invite(@invite,@place, new_user_registration_path(:invite_token => @invite.token)).deliver
             flash[:notice] = "Invitation was sent!."
             redirect_to @place
        end
      #did not save
      else
        flash[:alert] = "Invitation was not sent. Please check your email and try again."
        redirect_to new_invite_path
      end

  end

  def accept_invite
    @invite = Invite.find(params[:id])
    @place = Place.find(@invite.place_id)

    @invite.accepted = true

    #Add the user to the user group
    current_user.places << @place

    if @invite.save
       flash[:notice] = "#{@place.name} invite was accepted."
       redirect_to @place
    else
      flash.now[:alert] = "Error saving. Please try again."
      redirect_to invites_path
    end
  end

  def decline_invite
    @invite = Invite.find(params[:id])
    @place = Place.find(@invite.place_id)

    @invite.accepted = false
    if @invite.save
       flash[:notice] = "#{@place.name} invite was declined."
       redirect_to invites_path
    else
      flash.now[:alert] = "Error saving. Please try again."
      redirect_to invites_path
    end
  end


  private

  def invite_params
    params.require(:invite).permit(:email)
  end

end
