import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { Box, Container, Grid, Typography, Card, CardMedia, CardContent } from "@mui/material";
import monanApi from "../api/monan";

function Details() {
  const { id } = useParams();
  const [dish, setDish] = useState(null);

  useEffect(() => {
    const fetchDish = async () => {
      const response = await monanApi.get(id);
      setDish(response);
    };

    fetchDish();
  }, [id]);

  if (!dish) {
    return null; // or loading indicator
  }
  
  return (
    <Box bgcolor="primary.main" color="white" minHeight="100vh">
      <Container maxWidth="md" sx={{ pt: 4 }}>
        <Card sx={{ display: 'flex' }}>
          <CardMedia
            component="img"
            sx={{ width: '40%' }}
            image={dish.hinh_anh}
            alt={dish.ten_mon}
          />
          <CardContent sx={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-start', justifyContent: 'center' }}>
            <Typography variant="h4" component="h1" gutterBottom>
              {dish.ten_mon}
            </Typography>
            <Typography variant="h6" gutterBottom>
              Dish id: {dish.ma_mon}
            </Typography>
            <Typography variant="h6" gutterBottom>
              Group: {dish.ma_nhom}
            </Typography>
          </CardContent>
        </Card>
      </Container>
    </Box>
  );
}

export default Details;
