# frozen_string_literal: true

# See https://guides.rubyonrails.org/action_controller_overview.html.
class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    if Event.date_present?(event_params)
      date = Date.new(*Event.convert_date(event_params))
    end
    @event = Event.new(name: event_params[:name], country: event_params[:country], description: event_params[:description], user_id: current_user.id, date: date)
    if @event.save
      flash[:notice] = "#{@event.name} created!"
      redirect_to @event
    else
      flash[:error] = @event.errors.full_messages.join(' | ')
      redirect_to new_event_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    flash[:notice] = "#{@event.name} updated!"
    render 'show'
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "#{@event.name} deleted!"
  end

  protected

  def event_params
    params.require(:event).permit(:name, :'date(3i)', :'date(2i)', :'date(1i)', :country, :description)
  end
end
