# frozen_string_literal: true

# Import generate_monthly_payslip method from lib folder
require './lib/generate_monthly_payslip'

module Api
  module V1
    class SalariesController < ApplicationController
      # Run the business logic for the GET request
      def index
        salaries = Salary.all

        # New json object to customized the json response
        new_json_hash = {
          salary_computations: salaries
        }

        render json: new_json_hash
      end

      # Run the business logic for the POST request
      def create
        # Get the name and salary from the parameters
        name = params[:name]
        annual_amount = params[:annual_amount]
        monthly_income_tax = GenerateMonthlyPayslip.calculate_monthly_income_tax(name, annual_amount)

        salary = Salary.new(employee_name: name, annual_salary: annual_amount, monthly_income_tax:)

        if salary.save
          # Return message of the object created
          render json: salary, status: :created
        else
          # Return message if there is an error
          render json: salary.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
