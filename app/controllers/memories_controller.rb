# frozen_string_literal: true

class MemoriesController < ApplicationController
  before_action :set_event, except: %i[index show edit update]
  before_action :set_memory, only: %i[show edit update destroy]

  def index
    @user = User.find(params[:user_id])
    @memories = @user.memories
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
    render :show
  end

  def edit;end

  def update
    if @memory.update(memory_params)
      redirect_to memory_path(@memory)
    else
      render :edit
    end
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

  def set_memory
    @memory = Memory.find(params[:id])
  end
end
