import { useState } from "react";
import { LoginPage } from ".";
import { api } from "../../utils/axios";
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

      if (errorsCaptured) {
        setErrors(errorsCaptured)
        return;
      }

      const { data } = await api.post('/login', loginPayload)
      if (data.token) {
        localStorage.setItem("@expressoApp:jwt", JSON.stringify(data.token));
        document.cookie = `@expresso_app:jwt=${JSON.stringify(data.token)}`
      }
    } catch (error) {
      alert(error)
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

