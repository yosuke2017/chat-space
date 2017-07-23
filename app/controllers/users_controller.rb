class UsersController < Devise::RegistrationsController

  def index

  end

  def update
   current_user.update(update_params)
  end

  private
  def update_params
    params.require(:user).permit(:name, :email)
  end
end

