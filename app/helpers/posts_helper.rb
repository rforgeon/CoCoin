module PostsHelper

  def user_is_authorized_for_post?(post)
      current_user && (current_user == post.user || current_user.is_admin?)
   end

end
