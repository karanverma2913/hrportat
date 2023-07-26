class HolidaysController < ApiController
  before_action :find_id, only: %i[show update destroy]
  before_action :authorizer, except: %i[index show]

  def index
    render json: Holiday.all, status: :ok
  end

  def show
    render json: @holiday, status: :ok
  end

  def create
    holiday = Holiday.new(holiday_params)
    if holiday.save
      render json: holiday, status: :created
    else
      render json: holiday.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @holiday.update(holiday_params)
    render json: @holiday, status: :ok
  end

  def destroy
    @holiday.destroy
    render json: @holiday, status: :ok
  end

  private

  def authorizer
    authorize Holiday
  end

  def find_id
    @holiday = Holiday.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: e, status: :unprocessable_entity
  end

  def holiday_params
    params.permit(:name, :date)
  end
end
