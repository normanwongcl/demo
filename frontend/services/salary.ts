import { apiConfig} from '../config/salariesApi';

export class SalaryService {
    public async getSalaries() {
        const response = await fetch(apiConfig.apiURL);
        const data = await response.json();
        return data;
    }
    
    public async createSalary(salary: any) {
        const response = await fetch(apiConfig.apiURL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(salary)
        });
        const data = await response.json();
        return data;
    }
}