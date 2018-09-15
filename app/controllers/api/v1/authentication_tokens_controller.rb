class Api::V1::AuthenticationTokensController < Devise::SessionsController
  skip_before_action :verify_authenticity_token # skip CSRF check for APIs

  prepend_before_action :require_no_authentication, only: [:create] # skip device auth check

  before_action :rewrite_param_names, only: [:create]

  def new
    render json: {response: "Authentication required"}, status: 401
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    yield resource if block_given?

    render json: {success: true, jwt: current_token, response: "Authentication successful" }
    #render json: {response: "Authentication successful. JWT token included in this response.", data: resource}
  end
 
  private
  def rewrite_param_names
    request.params[:user] = {email: request.params[:email], password: request.params[:password]}
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
