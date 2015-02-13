class DashboardController < SecuredController
  def show
    @user = session[:userinfo]
    puts "User: #{@user}"
  end
end
