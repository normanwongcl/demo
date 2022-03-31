# frozen_string_literal: true

class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.string :employee_name
      t.string :annual_salary
      t.string :monthly_income_tax

      t.timestamps
    end
  end
end
