# frozen_string_literal: true

# See https://guides.rubyonrails.org/action_controller_overview.html.
class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new; end

  def create
    date = Date.new(*convert_date(event_params))
    @event = Event.new(name: event_params[:name], country: event_params[:country], description: event_params[:description], user_id: current_user.id, date: date)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
    # binding.pry
    @event = Event.find(params[:id])
    render :show
  end

  def edit; end

  def update; end

  def destroy; end

  protected

  def event_params
    params.require(:event).permit(:name, :'date(3i)', :'date(2i)', :'date(1i)', :country, :description)
  end

  # Converts date hash in event_params to Date object.
  def convert_date(hash)
    %w[1 2 3].map { |element| hash["date(#{element}i)"].to_i }
  end
end
