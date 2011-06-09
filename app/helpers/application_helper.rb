module ApplicationHelper
  def short_date(date)
    date.strftime("%e %b %y")
  end
  
  def long_date(date)
    date.strftime("%e %b %y, %H:%M")
  end
end
