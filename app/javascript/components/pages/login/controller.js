import { useState } from "react";
import { LoginPage } from ".";

function LoginPageController() {
  const [loginPayload, setLoginPayload] = useState({ email: '', password: '' });

  function handleChangeInput(event) { 
    const { id: attribute, value } = event.target
    
    setLoginPayload({
      ...loginPayload,
      [attribute]: value
    })
  }

  function handleAuth(){

  }

  return <LoginPage
    loginPayload={loginPayload}
    handleAuth={handleAuth}
    handleChangeInput={handleChangeInput}
  />;
}

export { LoginPageController };

