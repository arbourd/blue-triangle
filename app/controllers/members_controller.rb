class MembersController < ApplicationController
  # GET /members/name/:number
  def name
    member = Member.find_by(number: params[:number])

    if member
      render json: { member_number: member.number,
                     member_name: member.full_name }
    else
      render json: 'Member number not found', status: 404
    end
  end
end
