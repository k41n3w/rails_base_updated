# frozen_string_literal: true

class UserController < ApplicationController
  before_action :authorize!, only: %i[update show]

  def create
    user = User.new(user_params)
    user.save!
    render json: { user: user }, status: :created
  end

  def login
    @email = login_params[:email]
    password = login_params[:password]

    return user_not_found unless user.present?
    return incorrect_password unless user.authenticate(password)

    render json: { session: Session.new(@user).token }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :unauthorized
  end

  def update
    find_user_by_token.update!(user_params)

    render json: { message: "User: #{@user.name} updated!" }, status: :ok
  end

  def show
    find_user_by_token

    render json: { user: @user }, status: :ok
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def user
    @user ||= User.find_by(email: @email)
  end

  def user_not_found
    render json: { error: 'Cant find user' }, status: :unauthorized
  end

  def incorrect_password
    render json: { error: 'Wrong password' }, status: :unauthorized
  end
end
