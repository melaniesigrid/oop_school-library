# frozen_string_literal: true

require_relative 'decorator'
require_relative 'capitalizedecorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.length > 10 ? @nameable.correct_name.slice(0, 10) : @nameable.correct_name
  end
end
