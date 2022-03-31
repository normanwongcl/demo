import type { NextPage } from 'next'
import styles from '../styles/Home.module.css'
import SimpleTable from '../components/simpleTable';
const Home: NextPage = () => {
  return (
    <div className="my-16 mx-4">
      <SimpleTable />
    </div>
  )
}

export default Home
