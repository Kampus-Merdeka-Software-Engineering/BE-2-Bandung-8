/*
  Warnings:

  - You are about to drop the `accommodation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `checkout` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `destination` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `transportation` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `accommodation` DROP FOREIGN KEY `accommodation_ibfk_1`;

-- DropForeignKey
ALTER TABLE `checkout` DROP FOREIGN KEY `checkout_ibfk_1`;

-- DropForeignKey
ALTER TABLE `checkout` DROP FOREIGN KEY `checkout_ibfk_2`;

-- DropForeignKey
ALTER TABLE `checkout` DROP FOREIGN KEY `checkout_ibfk_3`;

-- DropForeignKey
ALTER TABLE `checkout` DROP FOREIGN KEY `checkout_ibfk_4`;

-- DropTable
DROP TABLE `accommodation`;

-- DropTable
DROP TABLE `checkout`;

-- DropTable
DROP TABLE `destination`;

-- DropTable
DROP TABLE `transportation`;

-- CreateTable
CREATE TABLE `Transportation` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Accommodation` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `typeId` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `price` INTEGER NOT NULL,

    INDEX `Transportation_typeId_fkey`(`typeId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Destination` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Checkout` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `transportationId` INTEGER NOT NULL,
    `accommodationId` INTEGER NOT NULL,
    `fromDestId` INTEGER NOT NULL,
    `toDestId` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone` CHAR(15) NOT NULL,

    INDEX `Transportation_typeId_fkey`(`transportationId`),
    INDEX `Accommodation_id_fkey`(`accommodationId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Accommodation` ADD CONSTRAINT `Accommodation_typeId_fkey` FOREIGN KEY (`typeId`) REFERENCES `Transportation`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Checkout` ADD CONSTRAINT `Checkout_transportationId_fkey` FOREIGN KEY (`transportationId`) REFERENCES `Transportation`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Checkout` ADD CONSTRAINT `Checkout_accommodationId_fkey` FOREIGN KEY (`accommodationId`) REFERENCES `Accommodation`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Checkout` ADD CONSTRAINT `Checkout_fromDestId_fkey` FOREIGN KEY (`fromDestId`) REFERENCES `Destination`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Checkout` ADD CONSTRAINT `Checkout_toDestId_fkey` FOREIGN KEY (`toDestId`) REFERENCES `Destination`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
