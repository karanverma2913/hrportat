class ApiController < ActionController::API
  include JsonWebToken
  include Pundit::Authorization

  before_action :authenticate

  # rescue_from Pundit::NotAuthorizedError, with: :usprouer_not_authorized
  rescue_from CanCan::AccessDenied do |ex|
    render json: {message: ex}
  end

  def current_user
    @current_user
  end

  private

  def authenticate
    header = request.headers['Authorization']
    decoded = jwt_decode(header.split(' ').last)
    @current_user = User.find(decoded[:id])
  rescue StandardError
    render json: { error: 'Unauthorized user' }, status: :unprocessable_entity
  end

  # def user_not_authorized
  #   render json: { message: 'You are not authorized to perform this action.' }
  # end
end
