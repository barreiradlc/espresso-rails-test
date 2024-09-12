import * as React from 'react';

import logo from '../../../assets/logo.svg';

import { default as Box } from '@mui/material/Box';
import Button from '@mui/material/Button';
import CircularProgress from '@mui/material/CircularProgress';
import Container from '@mui/material/Container';
import Paper from '@mui/material/Paper';
import TextField from '@mui/material/TextField';
import { default as Typography } from '@mui/material/Typography';

import PropTypes from "prop-types";

function LoginPage({ handleChangeInput, handleAuth, loginPayload, errors, loading }) {
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
            <TextField error={!!errors.email} helperText={errors.email} value={loginPayload.email} onChange={handleChangeInput} id="email" label="Usuário" variant="outlined" type="email"/>
            <TextField error={!!errors.password} helperText={errors.password} value={loginPayload.password} onChange={handleChangeInput} id="password" label="Senha" variant="outlined" type="password"/>                
          </Box> 
          <Box className="bottom-buttons-container">
            {
              loading ?
                <CircularProgress color="inherit" /> :
                <Button onClick={handleAuth} variant="contained">ENTRAR</Button>
            }                      
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
