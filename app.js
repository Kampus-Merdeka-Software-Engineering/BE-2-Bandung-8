const express = require("express");
const cors = require("cors");

const app = express();
const PORT = 5000;

app.use(cors());
app.use(express.json());

app.get("/", async (req, res) => {
	res.status(200).send("This route for landing page / index.html");
});

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
