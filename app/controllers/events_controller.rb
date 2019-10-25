# frozen_string_literal: true

# See https://guides.rubyonrails.org/action_controller_overview.html.
class EventsController < ApplicationController
  def index
    @events = Event.all
    render 'events/index'
  end

  def new
    @event = Event.new
    render 'events/new'
  end

  def create; end

  def show; end

  def edit; end

  def update; end

  def destroy; end
end
