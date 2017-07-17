class InviteMailer < ApplicationMailer


  default from: "rforgeon@gmail.com"

  def existing_user_invite(invite,place)

    # headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
    # headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
    # headers["References"] = "<post/#{post.id}@your-app-name.example>"

    @invite = invite
    @sender = User.find(invite.sender_id)
    @place = place

    mail(to: @invite.email, subject: "🔑 #{@sender.name} has invited you to their CoCoin group '#{@place.name}'")
  end

  def new_user_invite(invite,place,token)

    # headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
    # headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
    # headers["References"] = "<post/#{post.id}@your-app-name.example>"

    @invite = invite
    @sender = User.find(invite.sender_id)
    @place = place
    @token = token

    mail(to: @invite.email, subject: "🔑 #{@sender.name} has invited you to their CoCoin group '#{@place.name}'")
  end


end
