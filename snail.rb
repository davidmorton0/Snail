require "test/unit/assertions"
include Test::Unit::Assertions

def snail(array)
  result = []
  if array[0].empty? then return [] else arr = array end
  (0..(array.length / 2) - 1).map do |x|
    arr = shrink_array(array, x)
    4.times do
      result += arr[0].take(arr.length - 1)
      arr = rotate_array(arr)
    end
  end
  result.push(array[array.length / 2][array.length / 2]) if array.length % 2 == 1
  return result
end

def rotate_array(array)
  (0..array.length - 1).to_a.reverse.map {|x| array.map {|y| y[x] } }
end

def shrink_array(array, x)
  (x..array.length - x - 1).map { |n| array[n][x..-x - 1] }
end

assert_equal(snail([[1,2,3],[4,5,6],[7,8,9]]), [1, 2, 3, 6, 9, 8, 7, 4, 5])
