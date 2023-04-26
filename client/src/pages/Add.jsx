import { useState } from "react";
import { Button, TextField } from "@mui/material";

function Add() {
  const [type, setType] = useState(null);
  const [id, setId] = useState("");
  const [name, setName] = useState("");
  const [image, setImage] = useState("");
  const [group, setGroup] = useState("");
  const [price, setPrice] = useState("");
  const [start, setStart] = useState("");
  const [end, setEnd] = useState("");
  const [sizePrices, setSizePrices] = useState([{ size: "", price: "" }]);

  const handleTypeClick = (type) => {
    setType(type);
  };

  const handleSizePriceChange = (index, key) => (event) => {
    const newValues = [...sizePrices];
    newValues[index][key] = event.target.value;
    setSizePrices(newValues);
  };

  const handleAddSizePrice = () => {
    setSizePrices([...sizePrices, { size: "", price: "" }]);
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

  const handleConfirm = () => {
    // handle confirm logic here
    console.log("Confirm clicked!");
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
          <Button variant="contained" onClick={handleConfirm}>
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
                value={sizePrice.price}
                onChange={handleSizePriceChange(index, "price")}
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
          <Button variant="contained" onClick={handleConfirm}>
            Confirm
          </Button>
        </div>
      )}
    </div>
  );
}

export default Add;
