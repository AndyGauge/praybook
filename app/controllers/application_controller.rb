class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
  	@current_user ||= session[:current_user_id] ? Person.find(session[:current_user_id]) : new_guest_user
  end

  def new_guest_user
  	Person.find(session[:current_user_id] = Person.create({}).id)
  end
  def guest?
  	# In single table inheritance it would appear that the type is nil for Person
  	!!current_user.type
  end
  def slay_current_user
  	@curent_user = session[:current_user_id] = nil
  end
end
