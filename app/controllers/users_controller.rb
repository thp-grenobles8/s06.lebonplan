class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(
      name: params[:name],
      description: params[:description]
    )
      flash[:success] = "Ton progil a été modifié !"
      redirect_to user_path(@user.id)
    else
      flash[:danger] = "Ton profil n'est pas valide !"
      render :edit
    end
  end
end
