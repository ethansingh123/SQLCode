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

CREATE TABLE Facility_Assets (
    Serial_Number VARCHAR(50) NOT NULL,
    Facility_State VARCHAR(15),
    Facility_City VARCHAR(30),
    Facility_Street_Address VARCHAR(150),
    FOREIGN KEY (Facility_State) REFERENCES Facility(State),
    FOREIGN KEY (Facility_City) REFERENCES Facility(City)
    FOREIGN KEY(Facility_Street_Address) REFERENCES Facility(Street_Address)
);
