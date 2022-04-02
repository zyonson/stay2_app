class ProfilesController < ApplicationController
  
  def edit
    @profile = Profile.find(current_user.id)

  end

  def show
  
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(params.require(:profile).permit(:avatar,:rename,:description))
      flash[:notice] = "プロフィールを更新しました"
      redirect_to edit_profile_path
    else
      flash[:notice] = "プロフィールの更新に失敗しました"
      render "edit"
    end
  end

end