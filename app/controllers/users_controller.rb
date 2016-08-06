class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def profile
    @favorites = current_user.places if current_user

  end

  def association
    @user_place = current_user.places.create(id: params[:place_id])
    if @user_place.save
      render :profile
      #put what happens if save and if not saved
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
