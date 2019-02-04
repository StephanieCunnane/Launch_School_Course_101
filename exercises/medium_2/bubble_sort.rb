def bubble_sort!(arr)
  swap_made = nil
  until swap_made == false
    swap_made = false
    arr.each_with_index do |elem, idx|
      if (idx < arr.size - 1) && elem > arr[idx + 1] 
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        swap_made = true
      end
    end
  end
  
  arr
end

# Given solution
def bubble_sort!(arr)
  loop do
    swapped = false
    1.upto(arr.size - 1) do |idx|
      next if arr[idx - 1] <= arr[idx]
      arr[idx - 1], arr[idx] = arr[idx], arr[idx - 1]
      swapped = true
    end
    
    break unless swapped
  end
  nil
end

arr = [5, 3]
bubble_sort!(arr)
p arr == [3, 5]

arr = [6, 2, 7, 1, 4]
bubble_sort!(arr)
p arr == [1, 2, 4, 6, 7]

arr = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(arr)
p arr == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

