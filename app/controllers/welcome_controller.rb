# frozen_string_literal: true

class WelcomeController < ApplicationController
  def home
    @new_memories = Memory.most_recent(4)
  end
end
 