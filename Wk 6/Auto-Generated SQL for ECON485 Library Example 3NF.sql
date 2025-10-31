CREATE TABLE `UserTypes` (
  `UserTypeID` int PRIMARY KEY AUTO_INCREMENT,
  `UserType` varchar(255) UNIQUE,
  `MaxLoans` int
);

CREATE TABLE `Users` (
  `UserID` varchar(255) PRIMARY KEY,
  `FirstName` varchar(255),
  `LastName` varchar(255),
  `UserTypeID` int
);

CREATE TABLE `ItemTypes` (
  `ItemTypeID` int PRIMARY KEY AUTO_INCREMENT,
  `ItemType` varchar(255) UNIQUE,
  `LoanDuration` int
);

CREATE TABLE `Authors` (
  `AuthorID` int PRIMARY KEY AUTO_INCREMENT,
  `AuthorName` varchar(255)
);

CREATE TABLE `Publishers` (
  `PublisherID` int PRIMARY KEY AUTO_INCREMENT,
  `PublisherName` varchar(255)
);

CREATE TABLE `Items` (
  `ItemID` varchar(255) PRIMARY KEY,
  `Title` varchar(255),
  `AuthorID` int,
  `PublisherID` int,
  `ItemTypeID` int
);

CREATE TABLE `ItemCopies` (
  `CopyID` int PRIMARY KEY AUTO_INCREMENT,
  `ItemID` varchar(255),
  `CopyNum` int
);

CREATE TABLE `Loans` (
  `LoanID` varchar(255) PRIMARY KEY,
  `UserID` varchar(255),
  `CopyID` int,
  `LoanDate` date,
  `ReturnDate` date
);

ALTER TABLE `UserTypes` COMMENT = 'User types like Student or Employee, with max loan limits';

ALTER TABLE `Users` COMMENT = 'Library users (students and employees)';

ALTER TABLE `ItemTypes` COMMENT = 'Item types like Book, Reference Book, Multimedia, Other, with standard loan durations';

ALTER TABLE `Authors` COMMENT = 'Authors or creators of items';

ALTER TABLE `Publishers` COMMENT = 'Publishers of library items';

ALTER TABLE `Items` COMMENT = 'Library items (unique by international ID, e.g., like ISBN)';

ALTER TABLE `ItemCopies` COMMENT = 'Physical copies of each item to handle multiples';

ALTER TABLE `Loans` COMMENT = 'Loan transactions';

ALTER TABLE `Users` ADD FOREIGN KEY (`UserTypeID`) REFERENCES `UserTypes` (`UserTypeID`);

ALTER TABLE `Items` ADD FOREIGN KEY (`AuthorID`) REFERENCES `Authors` (`AuthorID`);

ALTER TABLE `Items` ADD FOREIGN KEY (`PublisherID`) REFERENCES `Publishers` (`PublisherID`);

ALTER TABLE `Items` ADD FOREIGN KEY (`ItemTypeID`) REFERENCES `ItemTypes` (`ItemTypeID`);

ALTER TABLE `ItemCopies` ADD FOREIGN KEY (`ItemID`) REFERENCES `Items` (`ItemID`);

ALTER TABLE `Loans` ADD FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`);

ALTER TABLE `Loans` ADD FOREIGN KEY (`CopyID`) REFERENCES `ItemCopies` (`CopyID`);
