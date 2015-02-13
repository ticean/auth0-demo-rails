class HomeController < ApplicationController
  def show
    # Not secure, but OK for demo.
    # Go straight to dashboard if there's a user session.
    redirect_to '/dashboard' if session[:userinfo].present?
  end
end
