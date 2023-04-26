import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import {
  Box,
  Container,
  Typography,
  Card,
  CardMedia,
  CardContent,
} from "@mui/material";
import monanApi from "../api/monan";
import doanApi from "../api/doan";
import sizeApi from "../api/size";
import timApi from "../api/tim";

function Details() {
  const { id } = useParams();
  const [dish, setDish] = useState(null);
  const [tim, setTim] = useState([]);
  const [size, setSize] = useState([]);
  const [doan, setDoan] = useState(null);

  useEffect(() => {
    const fetchDish = async () => {
      const response = await monanApi.get(id);
      setDish(response);
    };
    fetchDish();
  }, [id]);

  useEffect(() => {
    const fetchData = async () => {
      if (dish && id.startsWith("F")) {
        const response = await doanApi.get(id);
        const response1 = await timApi.get(id);
        setDoan(response);
        setTim(response1);
        // console.log(tim);
        // console.log(response1);
      }
    };
    fetchData();
  }, [dish, id]);
  //   console.log(tim);
  useEffect(() => {
    const fetchData = async () => {
      if (dish && id.startsWith("D")) {
        const response2 = await sizeApi.get(id);
        setSize(response2);
      }
    };
    fetchData();
  }, [dish, id]);

  if (!dish) return null;

  return (
    <Box bgcolor="primary.main" color="white" minHeight="100vh">
      <Container maxWidth="md" sx={{ pt: 4 }}>
        <Card sx={{ display: "flex" }}>
          <CardMedia
            component="img"
            sx={{ width: "40%" }}
            image={dish.hinh_anh}
            alt={dish.ten_mon}
          />
          <CardContent
            sx={{
              display: "flex",
              flexDirection: "column",
              alignItems: "flex-start",
              justifyContent: "center",
            }}
          >
            <Typography variant="h4" component="h1" gutterBottom>
              {dish.ten_mon}
            </Typography>
            <Typography variant="h6" gutterBottom>
              Dish id: {dish.ma_mon}
            </Typography>
            <Typography variant="h6" gutterBottom>
              Group: {dish.ma_nhom}
            </Typography>
            {dish && id.startsWith("F") ? (
              <>
                <Typography variant="h6" gutterBottom>
                  Price: {doan && doan.don_gia} VND
                </Typography>
                <Typography variant="h6" gutterBottom>
                  Time:{" "}
                  {tim &&
                    tim.map((item) => (
                      <Typography key={item.id} variant="h6" gutterBottom>
                        {item.bat_dau} - {item.ket_thuc}
                      </Typography>
                    ))}
                </Typography>
              </>
            ) : (
              <Typography variant="h6" gutterBottom>
                Price:{" "}
                {size &&
                  size.map((item) => (
                    <Typography
                      key={size.ma_nuoc_uong}
                      variant="h6"
                      gutterBottom
                    >
                      {item.size} - {item.don_gia}
                    </Typography>
                  ))}
              </Typography>
            )}
          </CardContent>
        </Card>
      </Container>
    </Box>
  );
}

export default Details;
