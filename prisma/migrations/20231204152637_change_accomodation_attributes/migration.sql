/*
  Warnings:

  - You are about to drop the column `typeId` on the `Accommodation` table. All the data in the column will be lost.
  - Added the required column `transportationId` to the `Accommodation` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Accommodation` DROP FOREIGN KEY `Accommodation_typeId_fkey`;

-- AlterTable
ALTER TABLE `Accommodation` DROP COLUMN `typeId`,
    ADD COLUMN `transportationId` INTEGER NOT NULL;

-- CreateIndex
CREATE INDEX `Transportation_typeId_fkey` ON `Accommodation`(`transportationId`);

-- AddForeignKey
ALTER TABLE `Accommodation` ADD CONSTRAINT `Accommodation_transportationId_fkey` FOREIGN KEY (`transportationId`) REFERENCES `Transportation`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
