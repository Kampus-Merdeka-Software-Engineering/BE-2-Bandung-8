/*
  Warnings:

  - Added the required column `iconUrl` to the `Transportation` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Transportation` ADD COLUMN `iconUrl` VARCHAR(191) NOT NULL;
