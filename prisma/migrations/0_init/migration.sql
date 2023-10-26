-- CreateTable
CREATE TABLE `authors` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(45) NOT NULL,
    `last_name` VARCHAR(45) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `book_authors` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `book_id` INTEGER NOT NULL,
    `author_id` INTEGER NOT NULL,

    INDEX `fk_yl21_Books_has_yl21_Authors_yl21_Authors1_idx`(`author_id`),
    INDEX `fk_yl21_Books_has_yl21_Authors_yl21_Books_idx`(`book_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `books` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `release_date` YEAR NOT NULL,
    `cover_path` VARCHAR(255) NULL,
    `language` VARCHAR(45) NOT NULL,
    `summary` TEXT NULL,
    `price` DECIMAL(13, 4) NOT NULL,
    `stock_saldo` VARCHAR(45) NOT NULL DEFAULT '0',
    `pages` INTEGER NOT NULL,
    `type` ENUM('new', 'used', 'ebook') NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `clients` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(45) NOT NULL,
    `first_name` VARCHAR(45) NULL,
    `last_name` VARCHAR(45) NULL,
    `email` VARCHAR(255) NULL,
    `password` VARCHAR(255) NULL,
    `address` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `orders` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `delivery_address` VARCHAR(255) NOT NULL,
    `order_date` DATETIME(0) NOT NULL,
    `status` ENUM('ordered', 'paid', 'sent') NOT NULL,
    `client_id` INTEGER NOT NULL,
    `book_id` INTEGER NOT NULL,

    INDEX `fk_yl21_Orders_yl21_Books1_idx`(`book_id`),
    INDEX `fk_yl21_Orders_yl21_Clients1_idx`(`client_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `book_authors` ADD CONSTRAINT `fk_yl21_Books_has_yl21_Authors_yl21_Authors1` FOREIGN KEY (`author_id`) REFERENCES `authors`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `book_authors` ADD CONSTRAINT `fk_yl21_Books_has_yl21_Authors_yl21_Books` FOREIGN KEY (`book_id`) REFERENCES `books`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `fk_yl21_Orders_yl21_Books1` FOREIGN KEY (`book_id`) REFERENCES `books`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `fk_yl21_Orders_yl21_Clients1` FOREIGN KEY (`client_id`) REFERENCES `clients`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

