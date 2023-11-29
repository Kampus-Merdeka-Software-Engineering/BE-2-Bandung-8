const express = require('express');
const app = express();
const PORT = 5000;

app.get("/", (req, res) => {
    res.status(200).send("This route for landing page / index.html");
});

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});