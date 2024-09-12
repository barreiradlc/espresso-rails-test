import { useState } from "react";
import { LoginPage } from ".";
import { authenticateUser } from '../../common/requests/session/login';
import { validateLoginForm } from './validation';

function LoginPageController() {  
  const [loginPayload, setLoginPayload] = useState({ email: '', password: '' });
  const [errors, setErrors] = useState({});
  const [loading, setLoading] = useState(false);

  function handleChangeInput(event) {
    const { id: attribute, value } = event.target
    
    setLoginPayload({
      ...loginPayload,
      [attribute]: value
    })
  }

  async function handleAuth() {
    setLoading(true)
    try {
      const errorsCaptured = validateLoginForm(loginPayload)
      
      if (Object.keys(errorsCaptured).length) {
        setErrors(errorsCaptured)
        return;
      }

      const data = await authenticateUser(loginPayload)

      if (data.token) {
        localStorage.setItem("@expressoApp:jwt", JSON.stringify(data.token));
        document.cookie = `@expresso_app:jwt=${JSON.stringify(data.token)}`
      }
    } catch (error) {
      alert(error)
      throw new Error("Erro ao realizar login, tente novamente mais tarde!");
    }
    setLoading(true)
  }

  return <LoginPage
    handleChangeInput={handleChangeInput}
    loginPayload={loginPayload}
    handleAuth={handleAuth}
    loading={loading}
    errors={errors}
  />;
}

export { LoginPageController };

