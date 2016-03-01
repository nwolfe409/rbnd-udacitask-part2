class UdaciList
  attr_reader :title, :items, :type

  def initialize(options={})
    @title = options[:title] || "Untitled List"
    @items = []
  end
  
  def add(type, description, options={})
    type = type.downcase
    case type
      when "todo"
        @items.push TodoItem.new(description, options) if type == "todo"
      when "event"
        @items.push EventItem.new(description, options) if type == "event"
      when "link"
        @items.push LinkItem.new(description, options) if type == "link"
      else
        raise UdaciListErrors::InvalidItemType, "This type is invalid: #{type}"
    end
  end
  
  def delete(index)
    if @items.length > index
      @items.delete_at(index - 1)
    else
      raise UdaciListErrors::IndexExceedsListSize, "There is nothing at index:#{index}"
    end
  end
  
  def all
    a = Artii::Base.new :font => 'slant'
    puts a.asciify("#{@title}")
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
  
  def filter(type)
    a = Artii::Base.new :font => 'slant'
    puts a.asciify("#{@title}")
    puts "Filtered by #{type}"
    @items.each_with_index do |item, position|
      if item.class.name.downcase.include? type
        puts "#{position + 1}) #{item.details}"
      end
    end
  end
  
  def change_priority(num, priority)
    @items[num-1].priority = priority
  end
  
  def filter_by
    puts "Plese select the list type you would like to filter by"
    puts "1 - Todo Items"
    puts "2 - Events"
    puts "3 - Links"
    ans = gets.chomp
    type = case ans
    when "1" then "todo"
    when "2" then "event"
    when "3" then "link"
    else
      puts "please enter a valid type using 1-3"
      filter_by
    end
          
    filter(type)
  end
    
    
    

end
