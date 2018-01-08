module Steepest_ascent_algorithm

  def optimise(arr)

    counter1, counter2 = 0,0
    new_optimum_value = 0.0
    new_arr, temp_arr = arr

    current_value = max_value(arr)

    while counter1 < arr.size
      while counter2 < arr.size

        if counter1 != counter2

          temp_arr = arr
          swap_elements_in_array(temp_arr, counter1, counter2)
          new_optimum_value = max_value(temp_arr)

          if new_optimum_value > current_value
            current_value = new_optimum_value
            new_arr = temp_arr
          else
            swap_elements_in_array(temp_arr, counter1, counter2)
            new_optimum_value = max_value(temp_arr)
          end

        end
        counter2 += 1

      end
      counter2 = 0
      counter1 += 1

    end
    new_arr

  end


end
