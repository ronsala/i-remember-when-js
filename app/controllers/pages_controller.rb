# frozen_string_literal: true

# Routes static pages.
class PagesController <ApplicationController
  def about
    render 'about'
  end
end
