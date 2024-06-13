# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_authentication

  def new
    @user = User.new
  end

  def create
    @user = User.authenticate_by(user_params)
    if @user.present?
      session[:current_user_id] = @user.id
      redirect_to bidders_path, notice: "Login efetuado com sucesso!"
    else
      flash[:alert] = "Usuário e/ou senha inválidos!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to new_session_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
