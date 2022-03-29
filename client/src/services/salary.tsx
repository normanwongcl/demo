import { apiConfig} from '../config/api';

export class SalaryService {
    public async getSalaries() {
        const response = await fetch(apiConfig.apiURL);
        const data = await response.json();
        return data;
    }
    
}