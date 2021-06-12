class PageController < ApplicationController
  def home
    if current_user.is_a?(GuestUser)
      redirect_to new_user_session_path if current_user.is_a?(GuestUser)
    else
      redirect_to matrimonies_path 
    end
  end

  def about
  end

  def contact
  end
end
