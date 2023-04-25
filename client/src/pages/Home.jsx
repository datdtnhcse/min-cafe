import React from 'react';
import { Link as RouterLink } from 'react-router-dom';
import { Box, Button, Container, Grid, Typography } from '@mui/material';

function Home() {
  return (
    <Box bgcolor="primary.main" minHeight="100vh">
      <Container maxWidth="md">
        <Grid container spacing={3} justifyContent="center" alignItems="center" sx={{ minHeight: '100vh' }}>
          <Grid item xs={12} textAlign="center">
            <Typography variant="h2" component="h1" color="white" gutterBottom>
              Welcome to Restaurant Manager
            </Typography>
            <Typography variant="subtitle1" color="white" gutterBottom>
              Manage your restaurant with ease!
            </Typography>
            <Button variant="contained" color="secondary" size="large" component={RouterLink} to="/login">
              Get Started
            </Button>
          </Grid>
        </Grid>
      </Container>
    </Box>
  );
}

export default Home;
