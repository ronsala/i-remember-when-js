# frozen_string_literal: true

class MemoriesController < ApplicationController
  before_action :get_event

  def index
    @memories = @event.memories
  end

  def new
    @memory = @event.memories.build
  end

  def create
    
    @memory = @event.memories.build(memory_params)

    if @memory.save
      redirect_to event_memories_path(@memory)
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
    binding.pry
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

  def get_event
    @event = Event.find(params[:event_id])
  end


  def memory_params
    params.require(:memory).permit(:title, :body)
  end
end
