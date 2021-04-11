module InclinationHelper
  def incline(number, word, word1, word2)
    last_two_digits = number % 100

    return word2 if (11..14).include?(last_two_digits)

    last_digit = number % 10

    if last_digit == 1
      word
    elsif (2..4).include?(last_digit)
      word1
    else
      word2
    end
  end
end