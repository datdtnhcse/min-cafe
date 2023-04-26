import React from 'react';
import { AppBar, Toolbar, IconButton, Link } from '@mui/material';
import { InfoOutlined, AddCircleOutlineOutlined, EditOutlined } from '@mui/icons-material';
import LoginIcon from '@mui/icons-material/Login';
import { Link as RouterLink } from 'react-router-dom';

const Navbar = () => {
  return (
    <AppBar position="static">
      <Toolbar sx={{ justifyContent: 'space-between' }}>
        <IconButton color="inherit" component={RouterLink} to="/info">
          <InfoOutlined />
        </IconButton>

        <IconButton color="inherit" component={RouterLink} to="/add">
          <AddCircleOutlineOutlined />
        </IconButton>
        <IconButton color="inherit">
          <EditOutlined />
        </IconButton>
        <Link component={RouterLink} to="/login" color="inherit">
          <LoginIcon />
        </Link>
      </Toolbar>
    </AppBar>
  );
};

export default Navbar;