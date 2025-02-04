# Check if input is valid
module InputValidation
  def input_validation(arr, obj, state)
    tmp_array = []
    arr.each_with_index do |_, i|
      tmp = Integer(arr[i], exception: false)

      return false if tmp > 6 || tmp < 1

      tmp_array.push(tmp)
    end

    if state == 'guess' then obj.guess = tmp_array end
    if state == 'make' then obj.secret_code = tmp_array end

    arr.length == 4
  end
end
