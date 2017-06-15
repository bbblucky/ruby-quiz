def output(method)
  t_start = Time.now
  sorted = yield
  puts method
  sorted.each {|n| print n, ' '}
  puts "\n"
  puts Time.now - t_start
  puts "======"
end

def bubble_sort(array)
  for i in 1..array.size
    for j in 1..array.size-i
      if array[j-1] > array[j]
        array[j-1], array[j] = array[j], array[j-1]
      end
    end
  end
  array
end

def selection_sort(array)
  for i in 0..array.size-1
    min_index = i
    for j in i+1..array.size-1
      min_index = j if array[j] < array[min_index]
    end
    array[min_index], array[i] = array[i], array[min_index]
  end
  array
end

def insertion_sort(array)
  for i in 0..array.size-1
    index = i
    array_i = array[i]
    while index > 0 && array[index-1] > array_i
      array[index] = array[index-1]
      index -= 1
    end
    array[index] = array_i
  end
  array
end

def merge_sort(array)
  return array if array.size <= 1
  mid = array.size/2
  left = merge_sort(array.slice(0, mid))
  right = merge_sort(array.slice(mid, array.size-mid))
  merge_sorted_array(left, right)
end

def merge_sorted_array(left, right)
  sorted = []
  l, r = 0, 0
  while l < left.size && r < right.size
    if left[l] < right[r]
      sorted << left[l]
      l +=1
    else
      sorted << right[r]
      r +=1
    end
  end
  sorted += left[l..left.size]
  sorted += right[r..right.size]
  sorted
end

def quick_sort(array, lower, upper)
  return if lower >= upper
  pivot = array[lower]
  left, right = lower+1, upper
  while left <= right
    while left <= right && array[left] < pivot
      left += 1
    end
    while left <= right && array[right] >= pivot
      right -= 1
    end
    break if left > right
    array[left], array[right] = array[right], array[left]
  end
  array[lower], array[right] = array[right], array[lower]
  quick_sort(array, lower, right-1)
  quick_sort(array, right+1, upper)
  array
end

class HeapSort
  def parent(i)
    (i - 1) / 2
  end

  def left(i)
    2 * i + 1
  end

  def right(i)
    2 * i + 2
  end

  def build_max_heapify(nums, heap_size)
    (heap_size/2).downto(0).each do |i|
      max_heapify(nums, i, heap_size)
    end
    nums
  end

  def max_heapify(nums, k, len)
    while k < len
      max_index = k

      l = left(k)
      if l < len && nums[l] > nums[max_index]
        max_index = l
      end

      r = right(k)
      if r < len && nums[r] > nums[max_index]
        max_index = r
      end

      break if k == max_index

      nums[k], nums[max_index] = nums[max_index], nums[k]
      k = max_index
    end
    nums
  end

  def heap_sort(nums)
    len = nums.size
    build_max_heapify(nums, len)
    (len-1).downto(0).each do |i|
      nums[0], nums[i] = nums[i], nums[0]
      build_max_heapify(nums, i)
    end
    nums
  end

end

class HeapSort2
  attr_accessor :input

  def initialize(arg)
    @input=arg
  end

  def heap_sort
    heapify
    the_end=input.length-1
    while the_end > 0
      input[the_end], input[0]=input[0], input[the_end]
      the_end-=1
      shift_down(0, the_end)
    end
    input
  end

  def heapify
    the_start=(input.length-2)/2

    while the_start >=0
      shift_down(the_start, input.length-1)
      the_start-=1
    end
  end

  def shift_down(the_start, the_end)
    root=the_start
    while root*2+1 <= the_end
      child=root*2+1
      swap=root

      if input[swap] < input[child]
        swap=child
      end

      if child+1 <= the_end && input[swap] < input[child+1]
        swap=child+1
      end

      if swap!=root
        input[root], input[swap]=input[swap], input[root]
        root=swap
      else
        return
      end

    end
  end

end


array = []
10000.times do
  array << rand(10000)
end
array.each {|n| print n, ' '}
puts "\n======"
# output('bubble'){bubble_sort(array)}
# output('selection'){selection_sort(array)}
# output('insertion'){insertion_sort(array)}
# output('merge') {merge_sort(array)}
# output('quick') {quick_sort(array, 0, array.size-1)}
output('heap') {
  heap = HeapSort.new
  heap.heap_sort(array)
}
output('heap2') {
  heap = HeapSort2.new(array)
  heap.heap_sort
}