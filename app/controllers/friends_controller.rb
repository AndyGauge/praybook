class FriendsController < ApplicationController
  include LoggedIn
  before_action :select_user_from_login

  def index
    new_friend
  end
  def create
    if @p = Person.find_by_email(params[:person][:email])
      @user.friends << @p
    else
      @user.friends.create(friendly_params)
    end
    redirect_to friends_path
  end
  def destroy
    if @del_me = @user.friends.find_by_id(params[:id])
      @user.friends.delete(@del_me)
    end
    redirect_to friends_path
  end
  def update
    @user.friends << Person.find(params[:id])
    redirect_to friends_path
  end
  def pray
    @friend = Person.find(params[:id])
    @prayer = @user.prayers.new
    @for = @friend
    render json: {
      'person' => @friend.name,
        'html' => render_to_string(partial: 'pray.html.erb', locals: { friend: @friend, prayer: @prayer })
    }
  end
  def names
    render json: (@user.friends.map { |f| { name: f.name, id: f.id } })
  end
  def find
    all_results = Person.where('LOWER(name) LIKE ?', "%#{params[:person][:name].downcase}%") - [@user] if params[:person] && params[:person][:name]
    @people = ([] << (all_results && @user.friends) << (all_results - @user.friends)).flatten
  end
  
  private
  def new_friend
    @friend = Person.new
  end
  def friendly_params
    params.require(:person).permit(:name, :email)
  end
end
