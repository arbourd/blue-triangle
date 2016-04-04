class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_member!

  def pundit_user
    current_member
  end
end
