class FizzBuzz

  def result(number)
    result = ""
    result += "fizz" if number % 3 == 0
    result += "buzz" if number % 5 == 0
    result.empty? && number.to_s || result
  end
end
