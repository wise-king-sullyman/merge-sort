# frozen_string_literal: true

def merge_sort(unsorted_array)
  return unsorted_array if unsorted_array.size == 1

  unsorted_array_left = unsorted_array.slice!(0...unsorted_array.size / 2.floor)
  unsorted_array_right = unsorted_array

  sorted_array_left = merge_sort(unsorted_array_left)
  sorted_array_right = merge_sort(unsorted_array_right)

  merge(sorted_array_left, sorted_array_right)
end

def merge(sorted_array_left, sorted_array_right)
  combined_sorted_array = []
  until sorted_array_left.empty? || sorted_array_right.empty?
    if sorted_array_left.first < sorted_array_right.first
      combined_sorted_array.push sorted_array_left.shift
    else
      combined_sorted_array.push sorted_array_right.shift
    end
  end
  push_remaining_numbers_to_array(combined_sorted_array, sorted_array_left, sorted_array_right)
  combined_sorted_array
end

def push_remaining_numbers_to_array(to_array, *from_arrays)
  from_arrays.each do |from_array|
    to_array.push from_array.shift until from_array.empty?
  end
end

# This method is for testing purposes
def random_numbers(digits)
  array = []
  until array.size == digits
    array.push(rand(digits))
    array.uniq!
  end
  p "Array to be sorted is: #{array}"
  array
end

def test_sorting(digits_to_test)
  random_number_array = random_numbers(digits_to_test)
  random_number_array_control = random_numbers(digits_to_test)
  puts "Sorted array is: #{random_number_array}"

  if merge_sort(random_number_array) == random_number_array_control.sort
    puts 'Sort was successful!'
  else
    puts 'Sort was not successful'
  end
end

test_sorting(100)
