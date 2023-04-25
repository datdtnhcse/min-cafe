import React from 'react';
// import { Link as RouterLink } from 'react-router-dom';
import { Box, Button, Container, Grid, TextField, Typography } from '@mui/material';

function Login() {
  return (
    <Box bgcolor="primary.main" color="white" minHeight="100vh">
      <Container maxWidth="xs">
        <Grid container spacing={3} justifyContent="center" alignItems="center" sx={{ minHeight: '100vh' }}>
          <Grid item xs={12} textAlign="center">
            <Box bgcolor="white" p={4} borderRadius={4}>
              <Typography variant="h4" component="h1" gutterBottom color="secondary">
                Login
              </Typography>
              <Box sx={{ mt: 3 }}>
                <form>
                  <TextField
                    label="Username"
                    variant="outlined"
                    fullWidth
                    margin="normal"
                    InputProps={{
                      sx: { '&:hover': { bgcolor: 'white' } },
                    }}
                  />
                  <TextField
                    label="Password"
                    variant="outlined"
                    fullWidth
                    margin="normal"
                    type="password"
                    InputProps={{
                      sx: { '&:hover': { bgcolor: 'white' } },
                    }}
                  />
                  <Button variant="contained" color="secondary" fullWidth size="large" sx={{ mt: 3 }}>
                    Login
                  </Button>
                </form>
              </Box>
            </Box>
          </Grid>
        </Grid>
      </Container>
    </Box>
  );
}

export default Login;
