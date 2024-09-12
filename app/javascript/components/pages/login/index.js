import * as React from 'react';

import logo from '../../../assets/logo.svg';

import { default as Box } from '@mui/material/Box';
import Button from '@mui/material/Button';
import Container from '@mui/material/Container';
import Paper from '@mui/material/Paper';
import TextField from '@mui/material/TextField';
import { default as Typography } from '@mui/material/Typography';
import PropTypes from "prop-types";

function LoginPage({ handleChangeInput, handleAuth, loginPayload }) {
  return (
    <Box className='page'>
      <Container maxWidth="sm" className='float-container'>
        <img
          className='login-logo'
          src={logo}
        />
        <Paper elevation={1} className='login-form-container'>
          <Typography gutterBottom variant="h5" component="div">
            Logar no Espresso
          </Typography>          
          <Box
              className='login-form-content'
              component="form"
              noValidate
              autoComplete="off"
            >
            <TextField value={loginPayload.email} onChange={handleChangeInput} id="email" label="Usuário" variant="outlined" />
            <TextField value={loginPayload.password} onChange={handleChangeInput} id="password" label="Senha" variant="outlined" />                
          </Box> 
          <Box className="bottom-buttons-container">
            <Button variant="contained">ENTRAR</Button>
            <Button variant="outlined">CRIAR CONTA</Button>
          </Box>
        </Paper>        
      </Container>        
    </Box>
  );
}

LoginPage.propTypes = {
  loginPayload: PropTypes.object,
  handleAuth: PropTypes.func,
  handleChangeInput: PropTypes.func
};

export { LoginPage };
