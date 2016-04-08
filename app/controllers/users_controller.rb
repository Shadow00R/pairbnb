class UsersController < ApplicationController
  before_action :require_login
  
  def index
  	@user = User.all
  end

  def show 
  end

  def edit
  end
  

end
