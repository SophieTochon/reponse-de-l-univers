class StaticPagesController < ApplicationController
  def home
  end

  def secret
  	unless logged_in?
  		redirect_to login_path
  	end
  end
end
