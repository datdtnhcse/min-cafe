import React, { useState } from "react";
import {
  Box,
  Card,
  CardActionArea,
  CardContent,
  CardMedia,
  Container,
  Grid,
  IconButton,
  InputAdornment,
  TextField,
  Typography,
} from "@mui/material";
import SearchIcon from "@mui/icons-material/Search";
import monanApi from "../api/monan";
import { Link } from "react-router-dom";
// import axiosClient from '../axios.js';

function Info() {
  const [searchTerm, setSearchTerm] = useState("");
  const [data, setData] = useState([]);

  const handleSearchTermChange = (event) => {
    setSearchTerm(event.target.value);
  };

  const handleButtonClick = async () => {
    const searchParams = { search_text: searchTerm };
    const response = await monanApi.search(searchParams);
    setData(response);
    console.log(data);
  };

  // const filteredDishes = dishes.filter((dish) =>
  //   dish.name.toLowerCase().includes(searchTerm.toLowerCase())
  // );

  return (
    <Box bgcolor="white" color="primary.main" minHeight="100vh">
      <Container maxWidth="lg" sx={{ pt: 4 }}>
        <Typography variant="h4" component="h1" gutterBottom>
          List
        </Typography>
        <TextField
          label="Search dishes"
          variant="outlined"
          fullWidth
          margin="normal"
          style={{ marginBottom: 40 }}
          InputProps={{
            startAdornment: (
              <InputAdornment position="start">
                <IconButton
                  size="large"
                  sx={{ color: "grey.500" }}
                  aria-label="Search"
                  onClick={handleButtonClick}
                >
                  <SearchIcon />
                </IconButton>
              </InputAdornment>
            ),
          }}
          value={searchTerm}
          onChange={handleSearchTermChange}
        />
        <Grid container spacing={3}>
          {data?.map &&
            data.map((dish) => (
              <Grid item key={dish.id} xs={12} sm={6} md={4}>
                <Card sx={{ maxWidth: 345 }}>
                  {console.log(dish)}
                  <Link to={`/details/${dish.ma_mon}`}>
                    <CardActionArea>
                      <Box sx={{ display: "flex", justifyContent: "center" }}>
                        <CardMedia
                          component="img"
                          height="140"
                          image={dish.hinh_anh}
                          alt={dish.ten_mon}
                          sx={{ width: 200 }}
                        />
                      </Box>
                      <CardContent sx={{ backgroundColor: "#689af8" }}>
                        <Typography gutterBottom variant="h5" component="div" sx={{ textDecoration: "none", color: "black" }}>
                          {dish.ten_mon}
                        </Typography>
                      </CardContent>
                    </CardActionArea>
                  </Link>
                </Card>
              </Grid>
            ))}
        </Grid>
      </Container>
    </Box>
  );
}

export default Info;
