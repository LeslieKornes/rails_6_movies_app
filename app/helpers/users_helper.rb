module UsersHelper

  def profile_img(user)
    url = "http://secure.gravatar.com/avatar/#{user.gravatar_id}"
    image_tag(url, alt: user.name)
  end

  def which_button_text(user)
    if user.new_record?
      submit_tag "Create Account"
    else
      submit_tag "Update Account"
    end
  end


end
