class EventsController < ApiController
  before_action :authorizerr, except: %i[index show]
  before_action :find_id, only: %i[update show destroy]

  def index
    render json: Event.all, status: :ok
  end

  def show
    render json: @event, status: :ok
  end

  def create
    event = Event.new(event_params)
    if event.save
      render json: event, status: :created
    else
      render json: event.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @event.update(event_params)
    render json: @event, status: :ok
  end

   def apni
    @event.update(event_params)
    render json: @event, status: :ok
  end

  def destroy
    @event.destroy
    render json: @event, status: :ok
  end

  private

  def authorizerr
    authorize Event
  end

  def find_id
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: e, status: :unprocessable_entity
  end

  def event_params
    params.permit(:name, :date, :desc)
  end
end
