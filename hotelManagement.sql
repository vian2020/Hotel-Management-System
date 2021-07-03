Create Table Hotel (SyName VARCHAR (20) NOT NULL, SyEmail VARCHAR (50) NOT NULL , SyPhone VARCHAR (13) NOT NULL, PRIMARY KEY (SyName) ); 

Create Table Employee (EmployeeId VARCHAR (10) NOT NULL,  Fname VARCHAR (20) NOT NULL,  Lname VARCHAR (20) NOT NULL,  Position VARCHAR (20) NOT NULL, Address VARCHAR (20) NOT NULL, PRIMARY KEY (EmployeeId));
 
Create Table HotelEmp (EmployeeId VARCHAR (10) NOT NULL, SyName VARCHAR (20) NOT NULL REFERENCES Hotel, Attendance VARCHAR (10) NOT NULL, PRIMARY KEY (EmployeeId));

Create Table EmployeePhone (EmployeeId VARCHAR (10) NOT NULL, Employee_Phone varchar (13), PRIMARY KEY (EmployeeId));

Create Table Customer (CustId INT identity(1,1), Fname VARCHAR (20) NOT NULL, Sname VARCHAR (20) NOT NULL, CustEmail VARCHAR (50) NOT NULL, CustAddress varchar(10) , PRIMARY KEY (CustId));

Create Table Serve (EmployeeId VARCHAR (10) NOT NULL, PRIMARY KEY (EmployeeId),CustId int REFERENCES Customer);

Create Table Manage (SyName VARCHAR (20) NOT NULL, EmployeeId VARCHAR (10) NOT NULL, PRIMARY KEY (SyName));

Create Table Medical (PhyId VARCHAR (10) NOT NULL, Physician_Name VARCHAR (20) NOT NULL, PrescId VARCHAR (10) NOT NULL, EmployeeId VARCHAR (10) NOT NULL, CustId INT, PRIMARY KEY(PhyId));

Create Table Treat_Customer (PhyId VARCHAR (10) NOT NULL, CustId INT NOT NULL, PRIMARY KEY(PhyId));

Create Table CustPhone (CustId int NOT NULL, CustPhone varchar(13), PRIMARY KEY (CustId));

Create Table Reservation (CustId  int NOT NULL, PaytId varchar(10) NOT NULL, Date DATE, PRIMARY KEY(CustId, PaytId));

Create Table Treat_Employee(PhyId VARCHAR (10) NOT NULL, EmployeeId VARCHAR (10) NOT NULL, PRIMARY KEY(PhyId, EmployeeId));

Create Table Payment (PaytId varchar(10) NOT NULL, CustId int REFERENCES Customer, Payment_mode VARCHAR (10), Amount varchar(10), PRIMARY KEY(PaytId));

Create Table Sports_and_Games (GameName VARCHAR (10) NOT NULL, GameTime TIMESTAMP,  PRIMARY KEY(GameName));

Create Table Transport (VehicleId CHAR (8), Destination VARCHAR (10), Date DATE, PRIMARY KEY(VehicleId));

Create Table Accommodation (CustId INT, ArrDate DATE,  DepDate DATE, RoomNo VARCHAR (10) , PRIMARY KEY(CustId));

Create Table Spa_Sauna (Spa_Sauna_Id VARCHAR (10), CustId INT REFERENCES Customer, SCharges VARCHAR(10), PRIMARY KEY(Spa_Sauna_Id));

Create Table Laundry_Service (LaundId varchar (10) NOT NULL, RoomNo varchar (10) NOT NULL, CustId int REFERENCES Customer, Wash VARCHAR (10), Iron VARCHAR (10), PRIMARY KEY(LaundId, RoomNo));

Create Table Swimming_pool (SwName VARCHAR (10), CustId int REFERENCES Customer, SwCharges varchar(10), PRIMARY KEY(SwName));

Create Table Travel (CustId VARCHAR (10) NOT NULL, VehicleId CHAR (8) NOT NULL, RoomNo varchar(10) NOT NULL, PRIMARY KEY(CustId, VehicleId, RoomNo));

Create Table Hire (VehicleId CHAR (10) NOT NULL, TourCompany varchar(20) NOT NULL, PRIMARY KEY(VehicleId, TourCompany));

Create Table Visits (CustId int NOT NULL, TourCompany char(20) NOT NULL, RoomNo varchar (10) NOT NULL, PRIMARY KEY(CustId,TourCompany, RoomNo));

Create Table Laundry (LaundId VARCHAR (10), ClothQtty INT,  ClothType VARCHAR (10), LaundCost VARCHAR (10), PRIMARY KEY(LaundId));

Create Table laundry_Detail (LaundId varchar(10) NOT NULL, CustId VARCHAR (10) NOT NULL, PRIMARY KEY(LaundId, CustId));

Create Table Recreate (CustId INT NOT NULL, GameName VARCHAR (10) NOT NULL, PRIMARY KEY(CustId, GameName));

Create Table Booking (ConfId VARCHAR (10) NOT NULL, CustId INT NOT NULL, PRIMARY KEY(ConfId, CustId));

Create Table Restaurant ( MealType VARCHAR (10), MealQuantity INT , TableNo INT , CustId INT NOT NULL REFERENCES Customer,  MealCost VARCHAR (10), PRIMARY KEY(MealType));

Create Table Tour (TourCompany VARCHAR (20) NOT NULL, Toursite VARCHAR (20) NOT NULL, MealType VARCHAR (10)  REFERENCES Restaurant, TourCharges varchar(10), PRIMARY KEY(TourCompany));

Create table Room (RoomNo varchar (10),Price varchar(10), RoomType VARCHAR (10), MealType VARCHAR (10) REFERENCES Restaurant, primary key(RoomNo));

Create Table Conference_Events_Center_Service (ConfId VARCHAR (10) NOT NULL, MealType VARCHAR (10) REFERENCES Restaurant, PRIMARY KEY(ConfId));

Create Table Conference_Events_Center (ConfId VARCHAR (10) NOT NULL, Date DATE, StartTime TIME, FinishTime TIME, MealType VARCHAR (10)  REFERENCES Restaurant, ConfCharges VARCHAR (10), PRIMARY KEY(ConfId));

Create Table CustActivity (CustId INT NOT NULL,Spa_Sauna_Id VARCHAR (10) REFERENCES Spa_Sauna,  SyName VARCHAR (20) REFERENCES Hotel, SwName VARCHAR (10) REFERENCES Swimming_pool, MealType VARCHAR (10)  REFERENCES Restaurant,  PRIMARY KEY(CustId));
