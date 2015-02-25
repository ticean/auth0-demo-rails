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

  # Performs a simple check for a user session. If the user is logged in then
  # redirect to the target URL specified in the `targetUrl` querystring
  # parameter.
  #
  # If the user is not logged in, redirect to initiate the authorizion flow on
  # the identity provider. If the user has a session on the SSO then she will
  # be automatically logged in.
  #
  # NOTE: The redirect target URL is provided via a querystring param. This
  # method is not secure, as users could be redirected to non-secure third-party
  # URLs. The param should be checked that it is a link within this application.
  def sso
    target_url = params['targetUrl']
    redirect_link = target_url.present? ? target_url : '/'
    if session[:userinfo].present?
      # User is logged in.
      redirect_to redirect_link
    else
      # User is not logged in.
      auth_url = "https://#{ENV['AUTH0_DOMAIN']}/authorize?" \
                 "response_type=code" \
                 "&scope=openid" \
                 "&client_id=#{ENV['AUTH0_CLIENT_ID']}" \
                 "&redirect_uri=#{ENV['AUTH0_CALLBACK_URL']}" \
                 "&state=#{redirect_link}"
      redirect_to auth_url
    end
  end
end
