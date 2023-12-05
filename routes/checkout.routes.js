const express = require("express");
const checkoutRoutes = express.Router();
const { prisma } = require("../config/prisma");
// const bodyParser = require("body-parser");

checkoutRoutes.post("/", async (req, res) => {
	// const date = new Date().toISOString();
	const {
		transportationId,
		accommodationId,
		fromDestId,
		toDestId,
		date,
		name,
		email,
		phone,
	} = req.body;

	const newCheckout = await prisma.checkout.create({
		data: {
			transportationId: transportationId,
			accommodationId: accommodationId,
			fromDestId: fromDestId,
			toDestId: toDestId,
			date,
			name,
			email,
			phone,
		},
	});

	res.status(201).json({
		message: "Checkout created",
		data: newCheckout,
	});
});

module.exports = { checkoutRoutes };
