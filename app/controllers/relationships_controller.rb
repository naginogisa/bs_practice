class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:id])
    current_user.follow(params[:id])

  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(params[:id])

  end

  def following
    @user = User.find(params[:user_id])
    @followings = @user.following_user.where.not(id: current_user.id)
  end

  # 自分をフォローしているユーザー一覧
  def follower
    @user = User.find(params[:user_id])
    @followers = @user.follower_user.where.not(id: current_user.id)
  end
end

