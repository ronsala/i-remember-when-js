# frozen_string_literal: true

# See https://guides.rubyonrails.org/action_controller_overview.html.
class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy authorized?]
  before_action :authenticate_user!, only: %i[new create]
  before_action :authorized?, only: %i[edit update destroy]

  def index
    @events = Event.all
    render json: @events, status: :ok
  end

  def new
    @event = Event.new
  end

  def create
    date = Date.new(*Event.convert_date(event_params)) if Event.date_present?(event_params)
    @event = Event.new(name: event_params[:name], country: event_params[:country], description: event_params[:description], user_id: current_user.id, date: date)
    if @event.save
      flash[:notice] = "#{@event.name} created!"
      render json: @event, status: :created
    else
      flash[:error] = @event.errors.full_messages.join(' | ')
      redirect_to new_event_path
    end
  end

  def show
    @creator = User.find(@event.user_id)
    render json: @creator, status: :ok
  end

  def edit; end

  def update
    @event.update(event_params)
    flash[:notice] = "#{@event.name} updated!"
    render json: @event, status: :ok
  end

  def destroy
    @event.destroy
    flash[:notice] = "#{@event.name} deleted!"
    render json: { eventId: @event.id }
  end

  protected

  def authorized?
    return unless @event.user_id != current_user.id && !current_user.admin

    flash[:alert] = "You don't have permission to perform this action."
    redirect_to root_path
  end

  def event_params
    params.require(:event).permit(:name, :'date(3i)', :'date(2i)', :'date(1i)', :country, :description)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
