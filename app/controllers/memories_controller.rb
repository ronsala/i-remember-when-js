# frozen_string_literal: true

class MemoriesController < ApplicationController
  def index; end

  def new; end

  def create
    @memory = Memory.new(memory_params)
    @memory.event_id = params[:event_id]
    @memory.user_id = current_user.id

    if @memory.save
      redirect_to @memory
    else
      render :new
    end
  end

  def show
    @memory = Memory.find(params[:id])
  end

  def edit
    @memory = Memory.find(params[:id])
  end

  def update; end

  def destroy; end

protected

  def memory_params
    params.require(:memory).permit(:title, :body)
  end
end
