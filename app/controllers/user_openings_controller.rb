class UserOpeningsController < ApplicationController
  def create
    current_user.user_openings.create(opening_id: set_opening.id)
    flash[:notice] = 'Opening was saved to your favorites.'
    redirect_to user_path(current_user)
  end

  def destroy
    user_opening = UserOpening.find(params[:id])
    user_opening.destroy
    flash[:success] = 'You have removed job opening from your favorites.'
    redirect_to user_path
  end

  private

  def set_opening
    Opening.find_by(id: params[:opening_id])
  end
end

