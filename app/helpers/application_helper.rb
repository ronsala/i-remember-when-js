# frozen_string_literal: true

# Changes dates to Month, Day, Year format.
module ApplicationHelper

  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end

  def format_date(date)
    date.strftime('%B %e, %Y')
  end
end
