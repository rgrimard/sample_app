class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  # for Ajax support
  respond_to :html, :js

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    # Ajax support
    respond_with @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    # Ajax support
    respond_with @user
  end
end