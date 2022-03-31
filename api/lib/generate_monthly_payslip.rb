# frozen_string_literal: true

# Import the Payslip class
require_relative './class/payslip'

# https://stackoverflow.com/questions/57277351/rails-6-zeitwerknameerror-doesnt-load-class-from-module
#
# Need to follow conventional file structure to load the class
# in salaries_controller.rb
#
# lib > generate_monthly_payslip.rb
# So module name is GenerateMonthlyPayslip
module GenerateMonthlyPayslip
  def self.generate_monthly_payslip(name, amount)
    payslip = Payslip.new(name, amount)

    payslip.output_json
  end

  def self.calculate_monthly_income_tax(name, amount)
    payslip = Payslip.new(name, amount)

    data = payslip.calculate_monthly_income_tax
    format('%.2f', data)
  end
end
