class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :show]

  def index
    if current_user.id != nil
      @user = User.find(current_user.id)
    end
  end
end
