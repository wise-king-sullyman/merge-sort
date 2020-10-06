# frozen_string_literal: true

def merge_sort(unsorted_array)
  return unsorted_array if unsorted_array.size == 1

  unsorted_array_left = unsorted_array.slice!(0...unsorted_array.size / 2.floor)
  unsorted_array_right = unsorted_array

  sorted_array_left = merge_sort(unsorted_array_left)
  sorted_array_right = merge_sort(unsorted_array_right)

  merge(sorted_array_left, sorted_array_right)
end

def merge(left_array, right_array)
  combined_sorted_array = []
  until left_array.empty? || right_array.empty?
    if left_array.first < right_array.first
      combined_sorted_array.push left_array.shift
    else
      combined_sorted_array.push right_array.shift
    end
  end
  combined_sorted_array + left_array + right_array
end

p merge_sort([5, 2, 3, 0, 1, 4])
