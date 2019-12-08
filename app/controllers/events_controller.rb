# frozen_string_literal: true

# See https://guides.rubyonrails.org/action_controller_overview.html.
class EventsController < ApplicationController
  def index
    @events = Event.all.sort_by(&:date)
    render 'events/index'
  end

  def new
    @event = Event.new
    render 'events/new'
  end

  def create
    date = Date.new(*convert_date(event_params))
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  protected

  def event_params
    params.require(:event).permit(:name, :'date(3i)', :'date(2i)', :'date(1i)', :country, :description, :user_id)
  end

  # Converts date hash in event_params to Date object.
  def convert_date(hash)
    %w[1 2 3].map { |element| hash["date(#{element}i)"].to_i }
  end
end
