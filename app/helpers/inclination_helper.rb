module InclinationHelper
  def incline(number, nominative, genitive_singular, genitive_plural)
    last_two_digits = number % 100
    last_digit = number % 10

    return genitive_plural if (11..14).include?(last_two_digits)

    if last_digit == 1
      nominative
    elsif (2..4).include?(last_digit)
      genitive_singular
    else
      genitive_plural
    end
  end
end