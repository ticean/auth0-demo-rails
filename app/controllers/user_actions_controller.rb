class UserActionsController < SecuredController
  before_action :user

  def new
  end

  def create
    # Publish event to messaging.
    # Would normally do local saving, etc.
    Hutch.publish(
      'sw.mail.user_action.created',
      actor: @user,
      verb: params['user_actions']['verb'],
      object: params['user_actions']['object'],
      target: params['user_actions']['target']
    )

    flash[:notice] = "User event was published."
    redirect_to new_user_action_url
  end

  private

  def user
    @user = session[:userinfo]
  end
end
