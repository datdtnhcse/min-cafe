import { useState } from "react";
import { Button, TextField } from "@mui/material";
import monanApi from "../api/monan";
import doanApi from "../api/doan";
import timApi from "../api/tim";
import sizeApi from "../api/size";
import drinkApi from "../api/drink";

function Add() {
  const [type, setType] = useState(null);
  const [id, setId] = useState("");
  const [name, setName] = useState("");
  const [image, setImage] = useState("");
  const [group, setGroup] = useState("");
  const [price, setPrice] = useState("");
  const [start, setStart] = useState("");
  const [end, setEnd] = useState("");
  const [sizePrices, setSizePrices] = useState([]);

  const handleTypeClick = (type) => {
    setType(type);
  };

  const handleSizePriceChange = (index, key) => (event) => {
    const newValues = [...sizePrices];
    newValues[index][key] = event.target.value;
    setSizePrices(newValues);
  };

  const handleAddSizePrice = () => {
    const newId = id || ''; // set id to empty string if it's null
  
    setSizePrices([...sizePrices, { ma_nuoc_uong: newId, size: "", don_gia: "" }]);
  };
  const handleStartChange = (event) => {
    setStart(event.target.value);
  };

  const handleIdChange = (event) => {
    setId(event.target.value);
  };
  const handleNameChange = (event) => {
    setName(event.target.value);
  };
  const handleImageChange = (event) => {
    setImage(event.target.value);
  };
  const handleGroupChange = (event) => {
    setGroup(event.target.value);
  };
  const handlePriceChange = (event) => {
    setPrice(event.target.value);
  };

  const handleEndChange = (event) => {
    setEnd(event.target.value);
  };

  const handleConfirm = async (type) => {
    try {
      const basicInfo = { ma_mon: id, ten_mon: name, hinh_anh: image, ma_nhom: group };
      await monanApi.post(basicInfo);
  
      if (type === "food") {
        const foodPrice = { ma_mon: id, don_gia: price };
        const tim3 = { ma_do_an: id, bat_dau: start, ket_thuc: end };
        await doanApi.post(foodPrice);
        await timApi.post(tim3);
      }
  
      if (type === "drink") {
        const drink = { ma_mon: id };
        console.log(drink);
        await drinkApi.post(drink);
        
        for (let i = 0; i < sizePrices.length; i++) {
          const sizePrice = sizePrices[i];
          sizePrice.ma_nuoc_uong = id; 
          await sizeApi.post(sizePrice); 
        }
      }
      console.log("Successfully added new dish!");
    } catch (error) {
      console.error("Error while adding new dish: ", error);
    }
  };
  

  return (
    <div
      style={{ display: "flex", flexDirection: "column", alignItems: "center" }}
    >
      <h1 style={{ margin: "30px" }}>Add Page</h1>
      <div style={{ display: "flex", gap: "20px" }}>
        <Button variant="contained" onClick={() => handleTypeClick("food")}>
          Food
        </Button>
        <Button variant="contained" onClick={() => handleTypeClick("drink")}>
          Drink
        </Button>
      </div>
      {type === "food" && (
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            marginTop: "50px",
          }}
        >
          <TextField
            label="id"
            value={id}
            onChange={handleIdChange}
            style={{ marginBottom: "20px" }}
          />
          <TextField
            label="name"
            value={name}
            onChange={handleNameChange}
            style={{ marginBottom: "20px" }}
          />
          <TextField
            label="image"
            value={image}
            onChange={handleImageChange}
            style={{ marginBottom: "20px" }}
          />
          <TextField
            label="group"
            value={group}
            onChange={handleGroupChange}
            style={{ marginBottom: "20px" }}
          />
          <TextField
            label="price"
            value={price}
            onChange={handlePriceChange}
            style={{ marginBottom: "20px" }}
          />
          <TextField
            label="start"
            value={start}
            onChange={handleStartChange}
            style={{ marginBottom: "20px" }}
          />
          <TextField
            label="end"
            value={end}
            onChange={handleEndChange}
            style={{ marginBottom: "20px" }}
          />
          <Button variant="contained" onClick={() => handleConfirm(type)} >
            Confirm
          </Button>
        </div>
      )}
      {type === "drink" && (
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            marginTop: "50px",
          }}
        >
          <TextField
            label="id"
            value={id}
            onChange={handleIdChange}
            style={{ marginBottom: "20px" }}
          />
          <TextField
            label="name"
            value={name}
            onChange={handleNameChange}
            style={{ marginBottom: "20px" }}
          />
          <TextField
            label="image"
            value={image}
            onChange={handleImageChange}
            style={{ marginBottom: "20px" }}
          />
          <TextField
            label="group"
            value={group}
            onChange={handleGroupChange}
            style={{ marginBottom: "20px" }}
          />
          {sizePrices.map((sizePrice, index) => (
            <div
              style={{ display: "flex", gap: "20px", marginBottom: "20px" }}
              key={index}
            >
              <TextField
                label="size"
                value={sizePrice.size}
                onChange={handleSizePriceChange(index, "size")}
              />
              <TextField
                label="price"
                value={sizePrice.don_gia}
                onChange={handleSizePriceChange(index, "don_gia")}
              />
            </div>
          ))}
          <Button
            variant="contained"
            onClick={handleAddSizePrice}
            style={{ marginBottom: "20px" }}
          >
            Add Size and Price
          </Button>
          <Button variant="contained" onClick={() => handleConfirm(type)}>
            Confirm
          </Button>
        </div>
      )}
    </div>
  );
}

export default Add;
