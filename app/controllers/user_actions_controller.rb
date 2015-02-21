class UserActionsController < SecuredController
  before_action :user

  def new
  end

  def create
    app_name = ENV['APPLICATION_NAME'].underscore
    verb = params['user_actions']['verb']
    object = params['user_actions']['object']
    target = params['user_actions']['target']

    # Publish event to messaging.
    # Would normally do local saving, etc.
    Hutch.publish(
      "sw.#{app_name}.#{verb}",
      actor: @user,
      verb: verb,
      object: object,
      target: target
    )

    flash[:notice] = "User event was published."
    redirect_to new_user_action_url
  end

  private

  def user
    @user = session[:userinfo]
  end
end
