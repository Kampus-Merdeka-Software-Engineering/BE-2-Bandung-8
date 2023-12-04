const express = require("express");
const accommodationRoutes = express.Router();
const { prisma } = require("../config/prisma");

accommodationRoutes.get("/", async (req, res) => {
	try {
		const dest = await prisma.accommodation.findMany({
			include: {
				transportation: true,
			},
		});
		res.status(200).send(dest);
	} catch (error) {
		console.error(error);
	}
});

// Get accommodation by Id
accommodationRoutes.get("/:transportationId", async (req, res) => {
	const { transportationId } = req.params;
	const acmd = await prisma.accommodation.findMany({
		where: {
			transportationId: parseInt(transportationId),
		},
	});
	res.status(200).send(acmd);
});

module.exports = { accommodationRoutes };
