import { useState } from "react";
import { LoginPage } from ".";
import { api } from "../../utils/axios";

function LoginPageController() {
  const [loginPayload, setLoginPayload] = useState(    
    { email: '', password: '' }
  );

  function handleChangeInput(event) { 
    const { id: attribute, value } = event.target
    
    setLoginPayload({
      ...loginPayload,
      [attribute]: value
    })
  }

  async function handleAuth() {
    try {
      const { data } = await api.post('/login', loginPayload)
      if (data.token) {
        localStorage.setItem("@expressoApp:jwt", JSON.stringify(data.token));
        document.cookie = `@expresso_app:jwt=${JSON.stringify(data.token)}`
      }
    } catch (error) {
      alert(error)
    }
  }

  return <LoginPage
    loginPayload={loginPayload}
    handleAuth={handleAuth}
    handleChangeInput={handleChangeInput}
  />;
}

export { LoginPageController };

