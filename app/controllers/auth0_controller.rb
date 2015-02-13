class Auth0Controller < ApplicationController
  def callback
     # example request.env['omniauth.auth'] in https://github.com/auth0/omniauth-auth0#auth-hash
    # id_token = session[:userinfo]['credentials']['id_token']
    # store the user profile in session and redirect to root
    Rails.logger.info("Found omniauth.auth: #{request.env['omniauth.auth']}")
    session[:userinfo] = request.env['omniauth.auth']

    redirect_to '/dashboard'
  end

  def failure
    Rails.logger.info("Login failure. #{request.params['message']}")
    @error_msg = request.params['message']
  end
end
