# Usage: before_action :select_user_from_login, use @user in controller
module LoggedIn
  extend ActiveSupport::Concern

  def select_user_from_login
    @user = current_user.becomes(User)
  end
  def current_user
    session[:current_user_id] ? Person.find(session[:current_user_id]) : new_guest_user
  end
  def new_guest_user
    Person.find(session[:current_user_id] = Person.create({}).id)
  end
  def slay_current_user
    @curent_user = session[:current_user_id] = nil
  end
end