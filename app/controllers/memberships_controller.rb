class MembershipsController < ApplicationController
  include LoggedIn
  before_action :set_group
  before_action :select_user_from_login
  def index
  end

  def set_group
    @group = Group.find(params[:group_id])
    @members = @group.memberships
  end
end
