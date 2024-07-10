module Enumerable
  # Your code goes here
  def my_all?
    my_each { |ele| return false unless yield(ele) }
    true
  end

  def my_any?
    my_each { |ele| return true if yield(ele) }
    false
  end

  def my_count
    return self.size unless block_given?

    count = 0
    my_each  { |ele| count += 1 if yield(ele) }
    count
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0

    for ele in self
      yield(ele, i)
      i += 1
    end
  end

  def my_inject(initial_value)
    accumulator = initial_value
    my_each { |ele| accumulator = yield(accumulator, ele) }
    accumulator
  end

  def my_map(my_block=nil)
    result = []
    my_each { |ele| result << (my_block ?  my_block.call(ele) : yield(ele)) }
    result
  end

  def my_none?
    my_each { |ele| return false if yield(ele) }
    true
  end

  def my_select
    result = []
    my_each { |ele| result << ele if yield(ele)}
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    for ele in self do
      yield ele
    end
  end
end
