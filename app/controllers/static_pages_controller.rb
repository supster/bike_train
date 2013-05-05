class StaticPagesController < ApplicationController
  def home

  end

  def dashboard
  	redirect_to home_path if !signed_in?
  end
end
