function validateLoginForm(data){
  const errors = {};    
  
  if (!isValidEmail(data.email)) {
    errors.email = 'E-mail inválido';
  }

  if (!data.password) {
    errors.password = 'Senha obrigatória';
  } else if (data.password.length < 6) {
    errors.password = 'A senha precisa ter pelo menos 6 caracteres';   
  }

  return errors;
}  

const isValidEmail = (email) => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}


export { validateLoginForm };
