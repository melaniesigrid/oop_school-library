module Validation
  def validate_number(message)
    number = 0
    loop do
      print message
      input = gets.chomp.strip.to_i
      if input.is_a?(Integer) && input.positive? 0
        number = input
        break
      else
        puts 'Please enter a valid number'
      end
    end
    number
  end

  def validate_options(message, options)
    number = 0
    loop do
      print message
      input = gets.chomp.strip.to_i
      if options.include?(input)
        number = input
        break
      else
        puts 'Please enter a valid number'
      end
    end
    number
  end
end
