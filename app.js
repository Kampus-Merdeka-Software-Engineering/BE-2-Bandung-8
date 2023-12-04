require("dotenv").config();
const express = require("express");
const cors = require("cors");

const { transportRoutes } = require("./routes/transportation.routes");
const { destinationRoutes } = require("./routes/destination.routes");
const { accommodationRoutes } = require("./routes/accommodation.routes");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get("/", async (req, res) => {
	res.status(200).send("Hello World");
});

app.use("/transport", transportRoutes);

app.use("/destination", destinationRoutes);

app.use("/accommodation", accommodationRoutes);

app.post("/checkout", async (req, res) => {
	res.status(200).send("This route for add data in checkout table");
});

app.all("*", async (req, res) => {
	res.json({
		status: 404,
		message: "Page not found",
	});
});

app.listen(PORT, "0.0.0.0", () => {
	console.log(`Server running on http://localhost:${PORT}`);
});
