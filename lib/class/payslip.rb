# frozen_string_literal: true

require_relative './tax_bracket'

class Payslip
  # Using accessor, we get read / write methods to the attributes
  attr_accessor :employee_name, :annual_salary

  # define a constructor, taking in a name and annual_salary
  def initialize(employee_name = 'Ren', annual_salary = 60_000)
    @employee_name = employee_name
    @annual_salary = annual_salary.to_i # Covert string to integer
  end

  def calculate_gross_monthly_income
    @annual_salary / 12
  end

  def calculate_monthly_income_tax
    calculate_tax / 12
  end

  def calculate_net_monthly_income
    calculate_gross_monthly_income - calculate_monthly_income_tax
  end

  def output_json
    data = {
      employee_name: @employee_name,
      gross_monthly_income: format('%.2f', calculate_gross_monthly_income),
      monthly_income_tax: format('%.2f', calculate_monthly_income_tax),
      net_monthly_income: format('%.2f', calculate_net_monthly_income)
    }
    data.to_json
  end

  # define a method to calculate the total tax,
  # tax_brackets is an array of Interval objects that represent the tax brackets
  # tax_brackets will use a default array of tax brackets if not provided
  def calculate_tax(tax_brackets =
    [TaxBracket.new(0, 20_000, 0.00), TaxBracket.new(20_001, 40_000, 0.10), TaxBracket.new(40_001, 80_000, 0.20),
     TaxBracket.new(80_001, 180_000, 0.30), TaxBracket.new(180_001, Float::INFINITY, 0.40)])

    # Set up the current_amount, which we will decrement as we go through the tax brackets
    current_amount = @annual_salary

    # The amount to be tax for the current tax bracket
    taxable_amount = 0
    # The total accumulated tax
    total_tax = 0

    # Loop through each tax bracket in the array
    (0...tax_brackets.length).each do |index|
      tax_bracket = tax_brackets[index] # get the current tax bracket

      # if current interval_end not equal 20000, then we minus 1 from starting amount
      start_interval = tax_bracket.interval_end == 20_000 ? tax_bracket.interval_start : tax_bracket.interval_start - 1

      # Calculate the difference between the end and starting salary bracket
      interval_difference = tax_bracket.interval_end == Float::INFINITY ? Float::INFINITY : tax_bracket.interval_end - start_interval

      # Compare current_amount with the interval_difference
      if interval_difference < current_amount
        # Assign the difference in interval_difference
        taxable_amount = interval_difference
        current_amount -= taxable_amount # subtract current amount with taxable amount
        total_tax += taxable_amount * tax_bracket.percentage

        next # continue to next tax bracket
      end

      # Compare current_amount with the interval_difference
      next unless interval_difference > current_amount

      taxable_amount = current_amount # assign the current_amount to taxable amount
      current_amount = 0 # Since we used up all the current amount, assign 0 to it
      total_tax += taxable_amount * tax_bracket.percentage

      break # End loop when there no more amount to evaluate
    end
    total_tax
  end
end
