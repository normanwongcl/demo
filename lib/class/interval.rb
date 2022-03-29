# frozen_string_literal: true

class Interval
  attr_accessor :interval_start, :interval_end

  # define a constructor, taking in a interval_start and interval_end
  def initialize(interval_start, interval_end)
    @interval_start = interval_start
    @interval_end = interval_end
  end
end
