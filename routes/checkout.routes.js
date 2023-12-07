const express = require("express");
const checkoutRoutes = express.Router();
const { prisma } = require("../config/prisma");

checkoutRoutes.post("/", async (req, res) => {
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
			transportationId,
			accommodationId,
			fromDestId,
			toDestId,
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
