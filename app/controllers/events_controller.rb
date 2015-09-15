class EventsController < ApplicationController

  def index
    @events = Event.all
    @events.to_a.reverse!
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      # @users = User.all
      # @users = @users.map {|user| user if user.confirmed? }
      # @users.each do |user|
      #   unless !user
      #     Resque.enqueue(EmailNewsJob, @event.id, user.id)
      #   end
      # end
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :end_time, :start_time, :street_address, :city, :state, :zip)
  end
end
