# Check if input is valid
module InputValidation
  def input_validation(arr, obj)
    tmp_array = []
    arr.each_with_index do |_, i|
      tmp = Integer(arr[i], exception: false)

      return false if tmp > 6 || tmp < 1

      tmp_array.push(tmp)
    end
    obj.guess = tmp_array
    arr.length == 4
  end
end
