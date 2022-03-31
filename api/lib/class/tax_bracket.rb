# frozen_string_literal: true

require_relative './interval'

# Define a class tax that inherit the attributes from interval class
class TaxBracket < Interval
  attr_accessor :percentage

  # constructor
  def initialize(interval_start, interval_end, percentage)
    # Call the constructor of Interval class and pass the value
    super(interval_start, interval_end)

    # define a percentage attribute for the TaxBracket Object
    @percentage = percentage
  end
end
