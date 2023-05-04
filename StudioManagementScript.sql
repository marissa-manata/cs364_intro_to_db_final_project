-- creating tables
CREATE TABLE Dancer(
    DancerId INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
    FirstName NVARCHAR(30) NOT NULL,
    MiddleName NVARCHAR(30),
    LastName NVARCHAR(30) NOT NULL,
    Birthday NVARCHAR(10) NOT NULL, --MM-DD-YYYY
    StreetAddress NVARCHAR(50) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    State NVARCHAR(3) NOT NULL,
    ZipCode NVARCHAR(5) NOT NULL
);

CREATE TABLE Teacher(
    TeacherId INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
    FirstName NVARCHAR(30) NOT NULL,
    MiddleName NVARCHAR(30),
    LastName NVARCHAR(30) NOT NULL,
    Birthday NVARCHAR(10) NOT NULL, --MM-DD-YYYY
    StreetAddress NVARCHAR(50) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    State NVARCHAR(3) NOT NULL,
    ZipCode NVARCHAR(5) NOT NULL
);

CREATE TABLE Groups(
    GroupId INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
    Description NVARCHAR(150) NOT NULL
);

CREATE TABLE Song(
    SongId INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
    Name NVARCHAR(50) NOT NULL,
    Artist NVARCHAR(50) NOT NULL
);

CREATE TABLE Style (
    StyleId INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
    Name NVARCHAR(20) NOT NULL
);

CREATE TABLE Routine(
    RoutineNumber INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
    Name NVARCHAR(30) NOT NULL,
    AgeGroup INTEGER NOT NULL,
    Style INTEGER NOT NULL,
    Song INTEGER NOT NULL,
    CONSTRAINT fk_groups_routine FOREIGN KEY(AgeGroup) REFERENCES Groups(GroupId),
    CONSTRAINT fk_style_routine FOREIGN KEY(Style) REFERENCES Style(StyleId),
    CONSTRAINT fk_song_routine FOREIGN KEY(Song) REFERENCES Song(SongId)
);

CREATE TABLE BELONGS_IN (
    DancerId INTEGER NOT NULL,
    GroupId INTEGER NOT NULL,
    CONSTRAINT fk_dancer_belongs_in FOREIGN KEY(DancerId) REFERENCES Dancer(DancerId),
    CONSTRAINT fk_groups_belongs_in FOREIGN KEY(GroupId) REFERENCES Groups(GroupId)
);

CREATE TABLE PERFORMS (
    DancerId INTEGER NOT NULL,
    RoutineNumber INTEGER NOT NULL,
    CONSTRAINT fk_dancer_performs FOREIGN KEY(DancerId) REFERENCES Dancer(DancerId),
    CONSTRAINT fk_routine_performs FOREIGN KEY(RoutineNumber) REFERENCES Routine(RoutineNumber)
);

CREATE TABLE CHOREOGRAPHS (
    TeacherId INTEGER NOT NULL,
    RoutineNumber INTEGER NOT NULL,
    CONSTRAINT fk_teacher_choreographs FOREIGN KEY(TeacherId) REFERENCES Teacher(TeacherId),
    CONSTRAINT fk_routine_choreographs FOREIGN KEY(RoutineNumber) REFERENCES Routine(RoutineNumber)
);

CREATE TABLE TEACHES (
    TeacherId INTEGER NOT NULL,
    StyleId INTEGER NOT NULL,
    YearsTaught INTEGER NOT NULL,
    CONSTRAINT fk_teacher_teaches FOREIGN KEY(TeacherId) REFERENCES Teacher(TeacherId),
    CONSTRAINT fk_style_teaches FOREIGN KEY(StyleId) REFERENCES Style(StyleId)
);
----------------------------------------------------------------------------------------------------
--adding data

--Dancer table Inserts
INSERT INTO Dancer(FirstName, MiddleName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Marissa', 'Paige', 'Manata','05-21-2000', '1103 Heron Ct', 'Mukwonago', 'WI','53149');
INSERT INTO Dancer(FirstName, MiddleName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Payton', 'Grace', 'Bickett','05-31-2002', 'W271N2631 Orchard Ln', 'Pewaukee', 'WI','53072');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Samantha', 'Rinderle','03-01-2003', '1117 Mallard Ct', 'Mukwonago', 'WI','53149');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Penelope', 'Smith','08-13-2000', '123 Black Rd', 'North Prairie', 'WI','53153');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Maddi', 'Miramontes','10-30-2000', '456 Red Ln', 'Mukwonago', 'WI','53149');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Avery', 'Deering','12-18-2002', '789 Orange Ct', 'Mukwonago', 'WI','53149');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Elle', 'Conley','01-14-2002', '1123 Yellow Rd', 'Big Bend', 'WI','53103');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Victoria', 'Cleasby','03-25-2000', '1145 Green Ln', 'North Prairie', 'WI','53153');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Amanda', 'Setum','02-15-2002', '1167 Blue Rd', 'Big Bend', 'WI','53103');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Katie', 'Jones','04-20-2001', '1189 Purple Ct', 'Eagle', 'WI','53119');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Cherise', 'Smith','08-01-2002', '123 Black Rd', 'North Prairie', 'WI','53153');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Madelyn', 'Vanness','11-30-2009', '1223 Rose Rd', 'Eagle', 'WI','53119');
INSERT INTO Dancer(FirstName, MiddleName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Anna', 'Marie', 'Stone','06-04-2011', '1245 Lily Ln', 'North Prairie', 'WI','53153');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Katniss', 'Everdeen','07-10-2005', '1267 Daffodil Ct', 'Mukwonago', 'WI','53149');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Hermione', 'Granger','08-09-2006', '1289 Petunia Rd', 'Eagle', 'WI','53119');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Luna', 'Lovegood','09-06-2006', '1312 Marygold Ln', 'Mukwonago', 'WI','53149');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Betty', 'Benson','01-25-2004', '1334 Apple Rd', 'Big Bend', 'WI','53103');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Cadence', 'Charleston','02-28-2010', '1356 Orange Ln', 'North Prairie', 'WI','53153');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Debra', 'Downer','03-05-2011', '1378 Lemon Ct', 'Eagle', 'WI','53119');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Elizabeth', 'Ebert','04-11-2012', '1390 Lime Rd', 'Mukwonago', 'WI','53149');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Florence', 'Flynn','05-17-2013', '1412 Cherry Ln', 'Big Bend', 'WI','53103');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Gretta', 'Gordon','06-20-2014', '1434 Mango Ct', 'North Prairie', 'WI','53153');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Hannah', 'Hart','07-04-2015', '1456 Banana St', 'Eagle', 'WI','53119');
INSERT INTO Dancer(FirstName, MiddleName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Isabella', 'Ann', 'Inselberg','08-12-2003', '1478 Main St', 'Mukwonago', 'WI','53149');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Jessica', 'Jordan','09-06-2003', '1490 Elm Rd', 'Big Bend', 'WI','53103');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Katherine', 'Komas','10-31-2005', '1512 Oak Ln', 'North Prairie', 'WI','53153');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Lucy', 'Loomis','11-17-2006', '1534 Maple Ct', 'Eagle', 'WI','53119');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Mary', 'Matthews','12-25-2007', '1556 Pine St', 'Mukwonago', 'WI','53149');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Nicole', 'Nettles','01-18-2008', '1578 Birch Rd', 'Big Bend', 'WI','53103');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Olivia', 'Osman','02-02-2009', '1590 Linden Ln', 'North Prairie', 'WI','53153');
INSERT INTO Dancer(FirstName, MiddleName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Paige', 'Louise', 'Peters','03-09-2010', '1612 Sunny Ct', 'Eagle', 'WI','53119');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Quinn', 'Queens','04-07-2011', '1634 Rains St', 'Eagle', 'WI','53119');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Ryley', 'Richards','05-18-2012', '1656 Snowball Rd', 'Mukwonago', 'WI','53149');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Sandy', 'Simons','06-23-2013', '1678 Hail Ln', 'Big Bend', 'WI','53103');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Theresa', 'Thomas','07-28-2014', '1690 Tornado Ct', 'North Prairie', 'WI','53153');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Ursala', 'Umbridge','08-28-2015', '1712 Sandstorm St', 'Eagle', 'WI','53119');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Veronica', 'Vick','09-17-2002', '1734 Hurricane Rd', 'Mukwonago', 'WI','53149');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Wendy', 'Weinkoff','10-06-2003', '1756 Tsunami Ln', 'Big Bend', 'WI','53103');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Yolanda', 'Yager','11-24-2004', '1778 Earthquake Ct', 'North Prairie', 'WI','53153');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Zola', 'Zander','12-01-2005', '1790 Sleet St', 'Eagle', 'WI','53119');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Abbigal', 'Brenton','01-06-2006', '1812 McDonalds Rd', 'Mukwonago', 'WI','53149');
INSERT INTO Dancer(FirstName, MiddleName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Caitlyn', 'Marie', 'Duncan','02-19-2007', '1834 Hardees Ln', 'Big Bend', 'WI','53103');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Emily', 'Finn','03-08-2008', '1856 Culvers Ct', 'North Prairie', 'WI','53153');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Gloria', 'Hann','04-1-2009', '1878 Panera St', 'Eagle', 'WI','53119');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Izzy', 'Jones','05-29-2010', '1890 Dominos Rd', 'Mukwonago', 'WI','53149');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Katrina', 'Lemke','06-21-2011', '1912 Chicago Ln', 'Big Bend', 'WI','53103');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Madison', 'Nottingham','07-07-2012', '1934 Milwaukee Ct', 'North Prairie', 'WI','53153');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Olivia', 'Peabody','08-10-2013', '1956 La Crosse St', 'Eagle', 'WI','53119');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Rebecca', 'Stevens','09-13-2014', '1978 Oswego Rd', 'Mukwonago', 'WI','53149');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Tiffany', 'Vickoff','10-08-2015', '1990 Waukesha Ln', 'Big Bend', 'WI','53103');
INSERT INTO Dancer(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Wilma', 'Yeager','11-16-2002', '2012 Onalaska Ct', 'North Prairie', 'WI','53153');
--SELECT * FROM Dancer

--Teacher table Inserts
INSERT INTO Teacher(FirstName, MiddleName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Jackie', 'Jane', 'Schmit','12-09-1990', '2034 Dallas St', 'North Prairie', 'WI','53153');
INSERT INTO Teacher(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Kayla', 'Mitchell','01-31-1993', '2056 Springfield Rd', 'Eagle', 'WI','53119');
INSERT INTO Teacher(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Mara', 'Peters','02-16-1985', '2078 Yankee Ln', 'Mukwonago', 'WI','53149');
INSERT INTO Teacher(FirstName, MiddleName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Taylor', 'Anne', 'Timmers','03-14-1989', '2090 Bears Ct', 'Big Bend', 'WI','53103');
INSERT INTO Teacher(FirstName, LastName, Birthday, StreetAddress, City, State, ZipCode) VALUES('Stephanie', 'Smith','04-19-1990', '3012 Eagle St', 'North Prairie', 'WI','53153');
--SELECT * FROM Teacher

--Groups table Inserts
INSERT INTO Groups(Description) VALUES('5 - 8   Minis');
INSERT INTO Groups(Description) VALUES('9 - 11   Youth');
INSERT INTO Groups(Description) VALUES('12 - 14   Preteen');
INSERT INTO Groups(Description) VALUES('15 - 16   Teen');
INSERT INTO Groups(Description) VALUES('17+   Senior');
--SELECT * FROM Groups

--Song table Inserts
INSERT INTO Song(Name, Artist) VALUES('A Whole New World', 'The International Contemporary Dance Ensemble');
INSERT INTO Song(Name, Artist) VALUES('Fuego', 'Cheetah Girls');
INSERT INTO Song(Name, Artist) VALUES('Betty Boop', 'Banu Gibson');
INSERT INTO Song(Name, Artist) VALUES('At The Hop', 'Danny & The Juniors');
INSERT INTO Song(Name, Artist) VALUES('Itsy Bitsy Teenie Weenie Yellow Polka Dot Bikini', 'Brian Hyland');
INSERT INTO Song(Name, Artist) VALUES('You Know You Like It', 'DJ Snake & AlunaGeorge');
INSERT INTO Song(Name, Artist) VALUES('Wings', 'Little Mix');
INSERT INTO Song(Name, Artist) VALUES('Define Dancing', 'Thomas Newman');
INSERT INTO Song(Name, Artist) VALUES('The Gravel Road', 'James Newton Howard');
INSERT INTO Song(Name, Artist) VALUES('Torn', 'Nathan Lanier');
INSERT INTO Song(Name, Artist) VALUES('Medicine', 'Daughter');
INSERT INTO Song(Name, Artist) VALUES('Howl', 'Florence + The Machine');
INSERT INTO Song(Name, Artist) VALUES('Red Hands', 'R.E.V.O');
INSERT INTO Song(Name, Artist) VALUES('Treasure', 'Bruno Mars');
INSERT INTO Song(Name, Artist) VALUES('Blurred Lines (Radio Edit)', 'Robin Thicke');
INSERT INTO Song(Name, Artist) VALUES('Barefootin''', 'Scooter Lee');
INSERT INTO Song(Name, Artist) VALUES('Push It', 'Salt-N-Pepa');
INSERT INTO Song(Name, Artist) VALUES('You''re a Jerk', 'New Boyz');
INSERT INTO Song(Name, Artist) VALUES('Bring Em Out', 'T.I.');
INSERT INTO Song(Name, Artist) VALUES('That Man', 'Caro Emerald');
INSERT INTO Song(Name, Artist) VALUES('Paparazzi', 'Nate Fifield');
INSERT INTO Song(Name, Artist) VALUES('Cell Block Tango', 'Christopher N Hobson');
INSERT INTO Song(Name, Artist) VALUES('Man in the Mirror', 'Piano Crew');
INSERT INTO Song(Name, Artist) VALUES('La Vie Boheme', 'Cast of The Motion Picture Rent');
INSERT INTO Song(Name, Artist) VALUES('Ex-Wives', 'Six');
--SELECT * FROM Song

--Style table Inserts
INSERT INTO Style(Name) VALUES('Ballet');
INSERT INTO Style(Name) VALUES('Jazz');
INSERT INTO Style(Name) VALUES('Tap');
INSERT INTO Style(Name) VALUES('Lyrical');
INSERT INTO Style(Name) VALUES('Contemporary');
INSERT INTO Style(Name) VALUES('Hip Hop');
INSERT INTO Style(Name) VALUES('Musical Theatre');
INSERT INTO Style(Name) VALUES('Pointe');
--SELECT * FROM Style

--Routine table Inserts
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Ex-Wives', 5, 7, 25);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Mirror', 5, 8, 23);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Paparazzi', 4, 1, 21);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Bring Em Out', 5, 6, 19);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Push It', 3, 6, 17);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Blurred Lines', 3, 2, 15);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Red Hands', 3, 4, 13);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Medicine', 5, 5, 11);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Gravel Road', 3, 1, 9);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Wings', 3, 3, 7);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Polka Dot Bikini', 1, 3, 5);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Betty', 2, 3, 3);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('New World', 1, 1, 1);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Fuego', 1, 2, 2);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('At The Hop', 5, 3, 4);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Like It', 4, 3, 6);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Define Dancing', 2, 1, 8);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Torn', 2, 5, 10);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Howl', 4, 5, 12);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Treasure', 2, 2, 14);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Barefootin''', 4, 2, 16);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Jerk', 3, 6, 18);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('That Man', 5, 2, 20);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('Cell Block Tango', 5, 1, 22);
INSERT INTO Routine(Name, AgeGroup, Style, Song) VALUES('La Vie Boheme', 4, 7, 24);
--SELECT * FROM Routine

--BELONGS_IN table Inserts
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(1, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(2, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(3, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(4, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(5, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(6, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(7, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(8, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(9, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(10, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(11, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(12, 2);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(13, 2);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(14, 4);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(15, 3);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(16, 3);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(17, 4);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(18, 2);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(19, 2);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(20, 1);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(21, 1);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(22, 4);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(23, 4);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(24, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(25, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(26, 4);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(27, 3);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(28, 3);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(29, 3);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(30, 2);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(31, 2);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(32, 2);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(33, 1);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(34, 1);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(35, 1);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(36, 1);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(37, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(38, 5);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(39, 4);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(40, 4);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(41, 3);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(42, 3);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(43, 3);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(44, 2);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(45, 2);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(46, 2);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(47, 1);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(48, 1);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(49, 1);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(50, 1);
INSERT INTO BELONGS_IN(DancerId, GroupId) VALUES(51, 5);
--SELECT * FROM BELONGS_IN

--PERFORMS table Inserts
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(1, 1);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(2, 1);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(4, 1);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(5, 1);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(6, 1);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(7, 1);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(1, 2);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(2, 2);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(6, 2);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(10, 2);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(14, 2);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(25, 2);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(37, 2);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(39, 2);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(40, 2);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(51, 2);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(14, 3);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(17, 3);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(26, 3);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(39, 3);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(40, 3);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(1, 4);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(2, 4);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(4, 4);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(5, 4);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(6, 4);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(7, 4);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(8, 4);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(9, 4);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(11, 4);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(37, 4);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(51, 4);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(15, 5);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(27, 5);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(28, 5);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(29, 5);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(42, 5);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(43, 5);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(15, 6);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(16, 6);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(27, 6);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(28, 6);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(29, 6);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(41, 6);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(42, 6);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(43, 6);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(15, 7);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(16, 7);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(27, 7);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(28, 7);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(29, 7);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(41, 7);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(42, 7);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(43, 7);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(1, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(2, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(3, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(4, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(5, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(6, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(7, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(8, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(9, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(10, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(11, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(24, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(25, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(37, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(38, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(51, 8);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(15, 9);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(16, 9);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(27, 9);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(28, 9);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(29, 9);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(41, 9);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(42, 9);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(43, 9);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(16, 10);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(28, 10);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(29, 10);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(42, 10);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(43, 10);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(20, 11);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(21, 11);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(22, 11);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(23, 11);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(33, 11);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(34, 11);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(35, 11);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(36, 11);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(47, 11);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(48, 11);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(49, 11);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(50, 11);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(12, 12);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(18, 12);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(19, 12);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(31, 12);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(32, 12);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(44, 12);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(45, 12);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(21, 13);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(22, 13);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(23, 13);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(33, 13);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(34, 13);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(35, 13);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(36, 13);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(47, 13);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(48, 13);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(49, 13);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(50, 13);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(21, 14);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(22, 14);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(23, 14);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(33, 14);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(34, 14);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(35, 14);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(36, 14);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(47, 14);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(48, 14);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(49, 14);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(50, 14);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(2, 15);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(3, 15);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(4, 15);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(6, 15);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(7, 15);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(8, 15);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(10, 15);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(11, 15);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(24, 15);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(25, 15);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(38, 15);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(51, 15);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(17, 16);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(26, 16);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(39, 16);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(40, 16);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(9, 16);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(12, 17);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(13, 17);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(18, 17);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(19, 17);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(30, 17);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(31, 17);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(32, 17);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(44, 17);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(45, 17);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(46, 17);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(12, 18);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(18, 18);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(19, 18);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(31, 18);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(32, 18);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(45, 18);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(46, 18);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(13, 18);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(30, 18);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(44, 18);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(14, 19);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(26, 19);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(39, 19);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(40, 19);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(17, 19);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(12, 20);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(13, 20);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(18, 20);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(19, 20);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(30, 20);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(31, 20);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(32, 20);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(44, 20);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(45, 20);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(46, 20);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(14, 21);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(17, 21);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(26, 21);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(39, 21);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(40, 21);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(14, 22);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(26, 22);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(39, 22);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(40, 22);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(10, 22);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(24, 22);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(1, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(2, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(3, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(4, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(5, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(6, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(7, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(8, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(9, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(10, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(11, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(24, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(25, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(37, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(38, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(51, 23);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(14, 24);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(17, 24);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(26, 24);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(39, 24);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(40, 24);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(14, 25);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(17, 25);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(26, 25);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(39, 25);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(40, 25);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(8, 25);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(9, 25);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(10, 25);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(11, 25);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(25, 25);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(38, 25);
INSERT INTO PERFORMS(DancerId, RoutineNumber) VALUES(51, 25);
--SELECT * FROM PERFORMS

--CHOREOGRAPHS table Inserts
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(3, 1);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(4, 2);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(1, 3);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(3, 4);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(1, 5);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(4, 6);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(1, 7);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(3, 8);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(4, 9);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(3, 10);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(4, 11);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(3, 12);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(4, 13);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(1, 14);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(4, 15);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(3, 16);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(2, 17);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(4, 18);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(5, 19);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(3, 20);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(2, 21);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(3, 22);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(4, 23);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(5, 24);
INSERT INTO CHOREOGRAPHS(TeacherId, RoutineNumber) VALUES(5, 25);
--SELECT * FROM CHOREOGRAPHS

--TEACHES table Inserts
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(1, 1, 7);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(1, 6, 4);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(1, 4, 3);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(1, 2, 9);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(2, 1, 4);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(2, 2, 2);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(3, 7, 12);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(3, 6, 6);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(3, 5, 13);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(3, 3, 8);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(3, 2, 5);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(4, 8, 5);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(4, 2, 2);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(4, 1, 1);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(4, 3, 7);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(4, 5, 9);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(5, 5, 2);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(5, 1, 6);
INSERT INTO TEACHES(TeacherId, StyleId, YearsTaught) VALUES(5, 7, 10);
--SELECT * FROM TEACHES

--------------------------------------------------------------------------
--Shows Dancers and Routines they are in
/*SELECT FirstName, LastName, Name 
  FROM Dancer JOIN PERFORMS JOIN Routine 
    ON Dancer.DancerId = PERFORMS.DancerId
   AND PERFORMS.RoutineNumber = Routine.RoutineNumber
ORDER BY Dancer.FirstName, Dancer.LastName;
/*

--Shows Routines with a certain number of dancers
/*SELECT Name, count(*) AS NumDancers 
  FROM (SELECT Name, DancerId 
          FROM PERFORMS JOIN Routine 
            ON PERFORMS.RoutineNumber = Routine.RoutineNumber
        ORDER BY Name) AS DancerCount
GROUP BY Name
HAVING count(*) = ?
/*

--Shows Routines over a certain style choreographed by the most experienced teacher
/*SELECT Routine.Name AS RoutineName, FirstName, LastName, StyleName 
  FROM (SELECT Teacher.TeacherId AS Teacher, FirstName, LastName, Style.StyleId, Style.Name AS StyleName, YearsTaught 
          FROM Teacher JOIN TEACHES JOIN Style 
            ON Teacher.TeacherId = TEACHES.TeacherId
           AND TEACHES.StyleId = Style.StyleId 
        GROUP BY Name 
        HAVING max(YearsTaught) AND Style.Name = ?) AS Experienced JOIN CHOREOGRAPHS JOIN Routine 
    ON Experienced.Teacher = CHOREOGRAPHS.TeacherId
   AND CHOREOGRAPHS.RoutineNumber = Routine.RoutineNumber 
   AND Experienced.StyleId = Routine.Style 
GROUP BY Routine.Name
/*