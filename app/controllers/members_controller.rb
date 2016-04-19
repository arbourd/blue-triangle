class MembersController < ApplicationController
  # GET /members/name/:number
  def name
    @member = Member.find_by(number: params[:number])
  end

  # GET members/:id/edit
  def edit
    @member = current_member
  end

  # GET members/:id/password
  def password
    @member = current_member
  end

  # PATCH members/:id
  def update
    @member = current_member
    if @member.update(members_params)
      redirect_to edit_member_path,
                  flash: { success: 'Successfully updated your profile.' }
    else
      flash[:error] = 'Error updating profile: ' \
                      "#{@member.errors.full_messages.to_sentence}"
      render :edit
    end
  end

  # PATCH members/:id/password
  def change_password
    @member = Member.find(current_member.id)
    if @member.update_with_password(members_pass_params)
      sign_in @member, :bypass => true
      redirect_to member_pass_path(@member), notice: 'Password changed!'
    else
      flash[:error] = 'Error changing password: ' \
                      "#{@member.errors.full_messages.to_sentence}"
      render :password
    end
  end

  private

  def members_params
    params.require(:member).permit(:fname, :lname)
  end

  def members_pass_params
    params.require(:member).permit(
      :current_password, :password, :password_confirmation
    )
  end
end
