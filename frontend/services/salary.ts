import { apiConfig } from '../config/salariesApi';

export const getSalaries = async () => {
  const response = await fetch(apiConfig.apiURL);
  const data = await response.json();
  return data;
};

export const createSalary = async (salary: any) => {
  const response = await fetch(apiConfig.apiURL, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(salary),
  });
  const data = await response.json();
  return data;
};
