const express = require("express");
const destinationRoutes = express.Router();
const { prisma } = require("../config/prisma");

destinationRoutes.get("/", async (req, res) => {
	const dest = await prisma.destination.findMany();
	res.status(200).send(dest);
});

module.exports = { destinationRoutes };
