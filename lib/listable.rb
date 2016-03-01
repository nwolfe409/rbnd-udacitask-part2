module Listable
  def format_description(description)
    "#{description}".ljust(30)
  end
  
  def format_date(due)
    @due ? @due.strftime("%D") : "No due date"
    dates = @start_date.strftime("%D") if @start_date
    dates << " -- " + @end_date.strftime("%D") if @end_date
    dates = "N/A" if !dates
    return dates
  end

  def format_priority(priority)
    value = " ⇧".colorize(:red) if @priority == "high"
    value = " ⇨".colorize(:yellow) if @priority == "medium"
    value = " ⇩".colorize(:blue) if @priority == "low"
    value = "" if !priority
    if !value
      raise UdaciListErrors::InvalidPriorityValue, "Priority type: #{priority} is not supported"
    end
    return value
  end
  
  

end