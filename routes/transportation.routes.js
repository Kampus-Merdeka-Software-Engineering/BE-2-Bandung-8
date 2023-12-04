const express = require("express");
const transportRoutes = express.Router();
const { prisma } = require("../config/prisma");

transportRoutes.get("/", async (req, res) => {
	const transport = await prisma.transportation.findMany();
	res.status(200).send(transport);
});

// Get transportation by Id
transportRoutes.get("/:id", async (req, res) => {
	const transport = await prisma.transportation.findUnique({
		where: {
			id: parseInt(req.params.id),
		},
	});

	if (!transport) {
		res.status(404).json({
			message: "Transportation not found",
		});
	} else {
		res.status(200).json(transport);
	}
});

module.exports = { transportRoutes };
