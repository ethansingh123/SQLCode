CREATE TABLE Supply_Order (
    Order_Number int not null,
    Type VARCHAR(30),
    Amount DECIMAL(10, 2),
    Status VARCHAR(20),
    Manufacturer_Name VARCHAR(50),
    Facility_State VARCHAR(15),
    Facility_City VARCHAR(20),
    Facility_Street_Address VARCHAR(100),
    FOREIGN KEY (Manufacturer_Name) REFERENCES Manufacturer(Manufacturer_Name),
    FOREIGN KEY (Facility_State, Facility_City, Facility_Street_Address) REFERENCES Facility(State, City, Street_Address)
    PRIMARY KEY (Order_Number);
);

CREATE TABLE Robot_Model_Sensory_Suite (
    Robot_Model_Number VARCHAR(20) not null,
    Sensory_Suite VARCHAR(100) not null,
    PRIMARY KEY (Robot_Model_Number, Sensory_Suite),
    FOREIGN KEY (Robot_Model_Number) REFERENCES Model(Model_Number)
);

CREATE TABLE Manufacturer(
    Manufacturer_Name varchar(30) not null,
    State varchar(15),
    City varchar(30),
    Street_Address varchar(100),
    PRIMARY KEY (Manufacturer_Name);

);

CREATE TABLE Model (
    Model_Number VARCHAR(50) NOT NULL,
    Year INT,
    Name VARCHAR(100),
    Battery_Autonomy DECIMAL(10, 2),
    Primary_Function VARCHAR(100),
    Payload_Capacity DECIMAL(10, 2),
    Distance_Autonomy DECIMAL(10, 2),
    Max_Speed DECIMAL(10, 2),
    Manufacturer_Name VARCHAR(100),
    FOREIGN KEY (Manufacturer_Name) REFERENCES Manufacturer(Manufacturer_Name)
    PRIMARY KEY (Model_Number)
);

CREATE TABLE Driverless_Car (
    DC_Serial_Number VARCHAR(50) NOT NULL,
    License_Plate VARCHAR(20),
    Status VARCHAR(50),
    Warehouse_Location VARCHAR(100),
    Warranty_Expiration DATE,
    DC_Model_Number VARCHAR(50)
    PRIMARY KEY (DC_Serial_Number)
);

CREATE TABLE Robot (
    Robot_Serial_Number VARCHAR(50) NOT NULL,
    Status VARCHAR(50),
    Warehouse_Location VARCHAR(100),
    Warranty_Expiration DATE,
    Robot_Model_Number VARCHAR(50),
    DC_Serial_Number VARCHAR(50),
    FOREIGN KEY (Robot_Model_Number) REFERENCES Model(Model_Number),
    FOREIGN KEY (DC_Serial_Number) REFERENCES Driverless_Car(DC_Serial_Number)
    PRIMARY KEY (Robot_Serial_Number)
);

CREATE TABLE Review (
    Review_Number VARCHAR(50) NOT NULL,
    Comment TEXT,
    Rating INT,
    Customer_SSN VARCHAR(9),
    Facility_Serial_Number VARCHAR (100),
    FOREIGN KEY (Customer_SSN) REFERENCES Customer(Customer_SSN),
    FOREIGN KEY (Facility_Serial_Number) REFERENCES Facility(Serial_Numbers),
    PRIMARY KEY (Review_Number)
);

CREATE TABLE First_Delivery_Case (
    Delivery_Date DATE NOT NULL,
    Door_Clearances DECIMAL(10, 2),
    WI_FI_Connection VARCHAR(64),
    Electrical_Capacity DECIMAL(10, 2),
    Privacy_Zones VARCHAR(100),
    Environment_Map VARCHAR(100),
    Robot_Serial_Number VARCHAR(50) NOT NULL,
    Employee_SSN VARCHAR(9),
    FOREIGN KEY (Robot_Serial_Number) REFERENCES Robot(Robot_Serial_Number),
    FOREIGN KEY (Employee_SSN) REFERENCES Employee(Employee_SSN)
    PRIMARY KEY (Delivery_Date, Robot_Serial_Number)
);

CREATE TABLE Facility_Assets (
    Serial_Number VARCHAR(50) NOT NULL,
    Facility_State VARCHAR(15),
    Facility_City VARCHAR(30),
    Facility_Street_Address VARCHAR(150),
    FOREIGN KEY (Facility_State) REFERENCES Facility(State),
    FOREIGN KEY (Facility_City) REFERENCES Facility(City)
    FOREIGN KEY(Facility_Street_Address) REFERENCES Facility(Street_Address)
    PRIMARY KEY (Serial_Number)
);

CREATE TABLE Facility (
    State VARCHAR(15) NOT NULL,
    City VARCHAR(30),
    Street_Address VARCHAR(100) NOT NULL,
    Phone VARCHAR(10),
    Vehicle_Capacity int,
    Robot_Capacity int,
    Manager_SSN VARCHAR(9),
    FOREIGN KEY (Manager_SSN) REFERENCES Employee(Employee_SSN);
    PRIMARY KEY (State, Street_Address);
)

CREATE TABLE Maintenance_Request(
    Request_Number int NOT NULL,
    Type VARCHAR(20),
    Description VARCHAR(200),
    Handler_SSN VARCHAR(9),
    Requester_SSN VARCHAR(9),
    Asset_Serial_Number int,
    FOREIGN KEY (Handler_SSN) REFERENCES Employee(Employee_SSN),
    FOREIGN KEY (Requester_SSN) REFERENCES Customer(Customer_SSN),
    PRIMARY KEY (Request_Number)
);

CREATE TABLE Customer (
    Customer_SSN VARCHAR(9) NOT NULL,
    Start_Date DATE,
    Facility_Distance int,
    Facility_State VARCHAR(15),
    Facility_City VARCHAR(30),
    Facility_Street_Address VARCHAR(100),
    FOREIGN KEY (Facility_State) REFERENCES Facility(Facility_State),
    FOREIGN KEY (Facility_City) REFERENCES Facility(Facility_City),
    FOREIGN KEY (Facility_Stre) REFERENCES Facility(Facility_Street_Address),
);
