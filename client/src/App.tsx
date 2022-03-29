import { useEffect, useState } from 'react';
import { SalaryService } from './services/salary';

import './App.css';

const App = () => {
  const [salaries, setSalaries] = useState([]);

  useEffect(() => {
    const salaryService = new SalaryService();

    const getAllSalaries = async () => {
      const response = await salaryService.getSalaries();
      setSalaries(response);
    }
    getAllSalaries();
  }, []);
  
  return (
    <div className="App">
      <header className="App-header">
        <pre>{JSON.stringify(salaries, null,2)}</pre>
      </header>
    </div>
  );
}

export default App;
