

def output(method)
  t_start = Time.now
  sorted = yield
  puts method
  sorted.each {|n| print n, ' ' }
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

array = []
10000.times do
  array << rand(10000)
end
array.each {|n| print n, ' ' }
puts "\n======"
# output('bubble'){bubble_sort(array)}
# output('selection'){selection_sort(array)}
# output('insertion'){insertion_sort(array)}
output('merge'){merge_sort(array)}
