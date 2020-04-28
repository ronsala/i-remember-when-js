# frozen_string_literal: true

class Api::V1::MemoriesController < ApplicationController
  before_action :set_event, only: %i[new create]
  before_action :set_memory, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create]
  before_action :authorized?, only: %i[edit update destroy]

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
      flash[:notice] = "#{@memory.title} created!"
      redirect_to memory_path(@memory)
    else
      flash[:error] = @memory.errors.full_messages.join(' | ')
      redirect_to new_event_memory_path(@event)
    end
  end

  def show; end

  def edit; end

  def update
    if @memory.update(memory_params)
      flash[:notice] = "#{@memory.title} updated!"
      redirect_to memory_path(@memory)
    else
      flash[:error] = @memory.errors.full_messages.join(' | ')
      redirect_to edit_event_memory_path(@memory.event)
    end
  end

  def destroy
    flash[:notice] = "#{@memory.title} deleted!"
    @memory.destroy
    redirect_to event_path(@memory.event)
  end

  protected

  def authorized?
    return unless @memory.user_id != current_user.id && !current_user.admin

    flash[:alert] = "You don't have permission to perform this action."
    redirect_to root_path
  end

  def memory_params
    params.require(:memory).permit(:title, :body, :event_id)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_memory
    @memory = Memory.find(params[:id])
  end
end
