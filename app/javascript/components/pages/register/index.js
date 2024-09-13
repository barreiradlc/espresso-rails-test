import * as React from 'react';

import logo from '../../../assets/logo.svg';

import { default as Box } from '@mui/material/Box';
import Container from '@mui/material/Container';
import Paper from '@mui/material/Paper';

function RegisterPage({ handleChangeInput, registerPayload, handleRegister, loading, errors }) {
  return (
    <Box className='page'>
      <Container maxWidth="sm" className='float-container'>
        <img
          className='register-logo'
          src={logo}
        />
        <Paper elevation={1} className='register-form-container'>
          
        </Paper>        
      </Container>        
    </Box>
  );
}


export { RegisterPage };
