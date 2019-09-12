# frozen_string_literal: true

class BinarySearch
  attr_reader :list

  def initialize(list)
    raise ArgumentError unless list == list.sort

    @list = list
  end

  def search_for(item)
    i = binary_search(list, item)
    raise RuntimeError if i == -1

    i
  end

  def binary_search(arr, item)
    return -1 if arr.length == 1 && arr[0] != item

    m = middle(arr)
    candidate = arr[m]
    return m if candidate == item

    item < candidate ?
      binary_search(arr[0...m], item) :
      m + binary_search(arr[m..arr.length], item)
  end

  def middle(arr = nil)
    arr = list if arr.nil?
    (arr.length / 2).floor
  end
end
