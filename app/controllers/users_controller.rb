class UsersController < ApiController
  skip_before_action :authenticate, only: [:login]
  before_action :authorizer, except:[:login]
  def index
    if params[:name].present?
      user = User.where("name like ?", "%#{params[:name]}%")
      render json: user, status: :ok
    else
      render json: User.all, status: :ok
    end
  end

  def login
    user = User.find_by(email: params[:email],password: params[:password])
    if user.present?
      render json: { token: jwt_encode(id: user.id) }, status: :ok
    else
      render json: { errors: 'Unauthorized User' }, staus: :unauthorized
    end
  end

  def show
    render json: @current_user, status: :ok
  end

  def create
    user = Employee.new(user_params)
    return render json: user, status: :ok if user.save
    render json: user.errors.full_messages, status: :unprocessable_entity
  end

  def update
    user = @current_user.update(password:params[:password])
    return render json: { details: user, message: 'updated succesfully' }, status: :ok if user
    render json: user.errors.full_messages, status: :unprocessable_entity
  end

  def destroy
    user =User.find_by(id:params[:id], type: "Employee") 
    if user.present?
      user.destroy 
      render json: { message: 'Deleted succesfully' }, status: :ok 
    else
      render json: { message: "Not Found" }, status: :unprocessable_entity
    end
  end

  private

  def authorizer
    authorize User
  end


  def user_params
    params.permit(:name, :email,:password,:role,:joining_date,:salary)
  end
end