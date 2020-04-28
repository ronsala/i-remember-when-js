# frozen_string_literal: true

class Api::V1::WelcomeController < ApplicationController
  def home
    @new_memories = Memory.most_recent(4)
  end
end
