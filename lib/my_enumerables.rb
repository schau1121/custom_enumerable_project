module Enumerable
  # Your code goes here
  def my_each_with_index
    return self unless block_given?

    i = 0
    for element in self do
      yield element, i
      i += 1
    end
  end

  def my_all?
    return self unless block_given?

    for element in self do
      return false if !yield(element)
    end

    return true
  end

  def my_any?
    return self unless block_given?
    
    for element in self do
      return true if yield(element)
    end

    return false
  end

  def my_none?
    return self unless block_given?

    for element in self do 
      return false if yield(element)
    end

    return true
  end

  def my_count
    return self.size unless block_given?

    count = 0
    for element in self do
      count += 1 if yield(element)
    end
    
    return count
  end

  def my_map
    return self unless block_given?

    out = Array.new
    for element in self do
      out << yield(element)
    end

    return out
  end

  def my_inject(initial_value)
    return self unless block_given?

    out = initial_value
    for element in self do
      out = yield(out, element)
    end

    return out
  end

  def my_select
    return self unless block_given?

    out = Array.new
    for element in self do
      out << element if yield(element)
    end
    
    return out
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each 
    return self unless block_given?
    for element in self do
      yield element
    end
  end
end
