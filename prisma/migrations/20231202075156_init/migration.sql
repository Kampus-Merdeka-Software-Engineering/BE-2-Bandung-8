-- CreateTable
CREATE TABLE `accommodation` (
    `id` INTEGER NOT NULL,
    `transport_type_id` INTEGER NULL,
    `name` VARCHAR(50) NULL,
    `price` FLOAT NULL,

    INDEX `transport_type_id`(`transport_type_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `checkout` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `transportation_id` INTEGER NULL,
    `accommodation_id` INTEGER NULL,
    `from_location_id﻿` INTEGER NULL,
    `to_location_id﻿` INTEGER NULL,
    `date` DATE NULL,
    `username` VARCHAR(255) NULL,
    `email﻿` VARCHAR(255) NULL,
    `phone` VARCHAR(255) NULL,

    INDEX `accommodation_id`(`accommodation_id`),
    INDEX `from_location_id﻿`(`from_location_id﻿`),
    INDEX `to_location_id﻿`(`to_location_id﻿`),
    INDEX `transportation_id`(`transportation_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `destination` (
    `id` INTEGER NOT NULL,
    `name` VARCHAR(50) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transportation` (
    `id` INTEGER NOT NULL,
    `transport_type` VARCHAR(50) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `accommodation` ADD CONSTRAINT `accommodation_ibfk_1` FOREIGN KEY (`transport_type_id`) REFERENCES `transportation`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `checkout` ADD CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`transportation_id`) REFERENCES `transportation`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `checkout` ADD CONSTRAINT `checkout_ibfk_2` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodation`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `checkout` ADD CONSTRAINT `checkout_ibfk_3` FOREIGN KEY (`from_location_id﻿`) REFERENCES `destination`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `checkout` ADD CONSTRAINT `checkout_ibfk_4` FOREIGN KEY (`to_location_id﻿`) REFERENCES `destination`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
