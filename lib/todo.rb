class TodoItem
  include Listable
  attr_reader :description, :due
  attr_accessor :priority
  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end
#  def format_description
#   "#{@description}".ljust(25)
  #end
#  def format_date
#    @due ? @due.strftime("%D") : "No due date"
#  end
#  def format_priority
#    value = " ⇧" if @priority == "high"
#    value = " ⇨" if @priority == "medium"
#    value = " ⇩" if @priority == "low"
#    value = "" if !@priority
#    return value
#  end
  def details
    format_description(@description) + "due: " +
    format_date(@due) +
    format_priority(@priority)
  end
end
