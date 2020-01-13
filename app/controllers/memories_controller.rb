# frozen_string_literal: true

class MemoriesController < ApplicationController
  before_action :set_event

  def index
    @memories = @event.memories
  end

  def new
    @memory = @event.memories.build
  end

  def create
    @memory = @event.memories.build(memory_params)
    @memory.user_id = current_user.id

    if @memory.save
      redirect_to event_memory_path(@event, @memory)
    else
      render :new
    end
  end

  def show
    @memory = Memory.find(params[:id])
  end

  def edit
    @memory = Memory.find(params[:id])
    @event = @memory.event
  end

  def update
    @memory = Memory.find(params[:id])
    @memory.update(memory_params)
    render 'show'
  end

  def destroy
    @memory = Memory.find(params[:id])
    event_id = @memory.event_id
    memory.destroy
    redirect_to "/events/<%= event_id %>"
  end

  protected

  def memory_params
    params.require(:memory).permit(:title, :body)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
