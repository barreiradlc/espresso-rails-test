import { useState } from 'react';
import { RegisterPage } from '.';

function RegisterPageController() {  
  const [registerPayload, setRegisterPayload] = useState({ email: '', password: '', company: { name: '', cnpj: '' }});
  const [errors, setErrors] = useState({});
  const [loading, setLoading] = useState(false);

  function handleChangeInput(event) {
    const { id: attribute, value } = event.target
    
    setRegisterPayload({
      ...registerPayload,
      [attribute]: value
    })
  }


  async function handleRegister() {
    setLoading(true)
    try {
      // const errorsCaptured = validateRegisterForm(loginPayload)
      const errorsCaptured = {}
      
      
      if (Object.keys(errorsCaptured).length) {
        setErrors(errorsCaptured)
        return;
      }

      // const data = await createUser(loginPayload)
      const data = {}

      if (data.token) {
        localStorage.setItem("@expressoApp:jwt", JSON.stringify(data.token));
        document.cookie = `@expresso_app:jwt=${JSON.stringify(data.token)}`
      }
    } catch (error) {
      alert(error)
      throw new Error("Erro ao realizar cadastro de usuário, tente novamente mais tarde!");
    }
    setLoading(false)
  }

  console.log({
    handleChangeInput,
    registerPayload,
    handleRegister,
    loading,
    errors,
  })

  

  return <RegisterPage
    handleChangeInput={handleChangeInput}
    registerPayload={registerPayload}
    handleRegister={handleRegister}
    loading={loading}
    errors={errors}
  />
}

export { RegisterPageController };

