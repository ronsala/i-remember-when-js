# frozen_string_literal: true

# Changes dates to Month, Day, Year format.
module ApplicationHelper
  def format_date(date)
    date.strftime('%B %e, %Y')
  end
end
