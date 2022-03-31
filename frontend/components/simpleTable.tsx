import { getSalaries } from '../services/salary';
import { useEffect, useState } from 'react';

interface PaySlipData {
  salary_computations: {
    id : number,
    employee_name: string,
    annual_salary: string,
    monthly_income_tax: string,
    created_at: string,
    updated_at: string,
  }
}
const SimpleTable:React.FC = () => {
    const [salaries, setSalary] = useState<PaySlipData | null> (null);

    useEffect(() => {
      const getResponse = async () => {
        setSalary(await getSalaries());
      }
      getResponse();
    }, []);
    return (
      <div className="px-4 sm:px-6 lg:px-8">
        <div className="sm:flex sm:items-center">
          <div className="sm:flex-auto">
            <h1 className="text-xl font-semibold text-gray-900">Payslip</h1>
            <p className="mt-2 text-sm text-gray-700">
              A list of of user payslips
            </p>
          </div>
        </div>
        <div className="mt-8 flex flex-col">
          <div className="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div className="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
              <div className="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
                <table className="min-w-full divide-y divide-gray-300">
                  <thead className="bg-gray-50">
                    <tr>
                     <th scope="col" className="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">
                        Payslip ID
                      </th>
                      <th scope="col" className="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">
                        Employee Name
                      </th>
                      <th scope="col" className="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">
                        Annual Salary
                      </th>
                      <th scope="col" className="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">
                        Monthly Income Tax
                      </th>
                      <th scope="col" className="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">
                        Created At
                      </th>
                      <th scope="col" className="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">
                        Updated At
                      </th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-200 bg-white">
                    {salaries?.salary_computations.map((salary) => (
                      <tr key={salary.id}>
                        <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6">
                          {salary.id}
                        </td>
                       <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{salary.employee_name}</td>

                        <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{salary.annual_salary}</td>
                        <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{salary.monthly_income_tax}</td>
                        <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{salary.created_at}</td>
                        <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{salary.updated_at}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    )
  }
  
export default SimpleTable