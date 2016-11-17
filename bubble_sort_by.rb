=begin

  * Main idea was loop until we no longer needed to rearrange the items. If we do need
    to rearrange items, then restart the whole iteration again.

    Initially, I thought the retry statement would work. But as of 1.9, you can only
    use retry in a begin block.

    In my first solution,  I used a counter instead of booleans. But using
    booleans is much cleaner.

    The key was to change the condition (that will stop the loop) at the top of the loop,
    and the condition that will continue the loop in the rearranging branch (which rests
    inside the iterator).

    (We can't put sorted = true at the bottom of the until loop because that forces
    one iteration of the loop; and we can't put it inside the iterator because it just
    overrides the assignment to sorted when we need to rearrange the item.)

    Hence, if we rearranged anything after the iterator is complete, then we may need
    to rearrange again, and the loop continues. And if we don't rearrange anything,
    then we can exit the loop, and stop iterating.

  * Worth noting that the only time we need to rearrange items is when the result is
  positive. If result is negative or 0, you don't need to touch them.


  * If array.length is, say, 4, then last_index is 3. And 3.times iterates through 0 
  to 2 and DOESN'T include 3. Hence, we never attempt to retrieve an index that isn't 
  available.

=end


def bubble_sort_by(array)

  last_index = array.length - 1

  sorted = false

  until sorted

    sorted = true

    last_index.times do |i|
      result = yield array[i], array[i+1]

      if result > 0
        array [i], array[i+1] = array[i+1], array[i]

        sorted = false
      end
    end

  end

  array
end

bubble_sort_by( ["hi", "hello", "hey", "o"] ) do |left, right|
  left.length - right.length
end