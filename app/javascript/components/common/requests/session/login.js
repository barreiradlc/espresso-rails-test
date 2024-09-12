import { api } from '../../../utils/axios';

async function authenticateUser(loginPayload) {  
  const response = await api.post('/login', loginPayload)
  const { data } = response
  
  return data
}

export { authenticateUser };

