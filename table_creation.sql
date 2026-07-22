create database sales_management
use sales_management

create table productlines(
product_line varchar(30) primary key,
text_discription varchar(50),
html_discription varchar(50),
image varchar(50));
insert into productlines(product_line,text_discription,html_discription,image)
value
  ('Classic Cars', 'Vintage and classic model cars', NULL, NULL),
  ('Motorcycles', 'Racing and sports bikes', NULL, NULL),
  ('Planes', 'Commercial and military aircraft models', NULL, NULL),
  ('Ships', 'Sailing ships and ocean liner replicas', NULL, NULL),
  ('Trains', 'Locomotive and railway models', NULL, NULL),
  ('Trucks and Buses', 'Heavy vehicle and public transport models', NULL, NULL),
  ('Vintage Cars', 'Pre-1960 antique automobile models', NULL, NULL),
  ('Scooters', 'Classic and modern scooter models', NULL, NULL),
  ('Race Cars', 'Formula and rally racing car models', NULL, NULL),
  ('Boats', 'Speed boats and fishing vessel models', NULL, NULL);


SET FOREIGN_KEY_CHECKS = 0;
drop table products;
SET FOREIGN_KEY_CHECKS = 1;

create table products(
product_code varchar(30) primary key,
product_name varchar(50),
product_line varchar(30),foreign key (product_line) references productlines(product_line),
product_sales varchar(50),
product_vendor varchar(50),
product_discription text,
quantity_in_stock int,
buy_price decimal(10,2),
MSRP decimal(10,2));
SET FOREIGN_KEY_CHECKS = 0;
insert into products(product_code,product_name,product_line,product_sales,product_vendor,product_discription,quantity_in_stock,buy_price,MSRP)
values
  ('S10_1678', '1969 Harley Davidson', 'Motorcycles', '1:10', 'Min Lin Diecast', 'Classic Harley Davidson bike model', 100, 4800, 6500),
  ('S12_1099', '1968 Ford Mustang', 'Classic Cars', '1:12', 'Autoart Studio', 'Classic Ford Mustang model', 50, 9500, 12000),
  ('S12_3380', '1957 Chevy Bel Air', 'Classic Cars', '1:12', 'Carousel DieCast', 'Detailed Chevy Bel Air with opening doors', 75, 7800, 10500),
  ('S18_2248', '1947 Royal Enfield', 'Motorcycles', '1:18', 'Min Lin Diecast', 'Vintage Royal Enfield motorcycle model', 120, 3200, 4500),
  ('S18_3140', 'Boeing 747 Jumbo Jet', 'Planes', '1:180', 'SkyScale Models', 'Boeing 747 with detailed livery', 60, 5600, 7800),
  ('S24_2000', 'HMS Victory', 'Ships', '1:240', 'Oceanic Replicas', 'Wooden sailing warship replica', 40, 8900, 11500),
  ('S24_3151', 'Indian Railways WP Steam Engine', 'Trains', '1:24', 'RailWorks Studio', 'Classic Indian steam locomotive model', 55, 6700, 9000),
  ('S32_1268', 'Tata 1613 Truck', 'Trucks and Buses', '1:32', 'HeavyHaul Models', 'Indian cargo truck replica', 90, 2800, 4000),
  ('S32_4485', '1936 Mercedes Benz 500K', 'Vintage Cars', '1:32', 'Autoart Studio', 'Luxury vintage roadster model', 35, 10200, 13500),
  ('S50_1392', 'Vespa 150 Classic', 'Scooters', '1:10', 'Min Lin Diecast', 'Retro Vespa scooter model', 150, 2100, 3200),
  ('S50_4713', 'Ferrari F1 2024', 'Race Cars', '1:18', 'SpeedLine Replicas', 'Formula 1 racing car model', 80, 7200, 9800),
  ('S72_3212', 'Kerala Fishing Boat', 'Boats', '1:72', 'Oceanic Replicas', 'Traditional fishing vessel model', 65, 1800, 2800);
SET FOREIGN_KEY_CHECKS = 1;


drop table orderdetails;
create table orderdetails(
order_numbar varchar(50), foreign key (order_numbar) references orders(order_number),
product_code varchar(30), foreign key (product_code) references products(product_code),
quantity_ordered int,
price_each decimal(10,2),
orderline_number int);
insert into orderdetails(order_numbar,product_code,quantity_ordered,price_each,orderline_number)
values
  (30001, 'S10_1678', 2, 6500, 1),
  (30002, 'S12_1099', 1, 12000, 1),
  (30003, 'S12_3380', 1, 10500, 1),
  (30003, 'S18_2248', 2, 4500, 2),
  (30004, 'S18_3140', 1, 7800, 1),
  (30005, 'S24_2000', 1, 11500, 1),
  (30006, 'S24_3151', 1, 9000, 1),
  (30007, 'S32_1268', 3, 4000, 1),
  (30008, 'S32_4485', 1, 13500, 1),
  (30009, 'S50_1392', 2, 3200, 1),
  (30010, 'S72_3212', 2, 2800, 1),
  (30011, 'S50_4713', 1, 9800, 1),
  (30012, 'S12_1099', 1, 12000, 1);


drop table orders;
create table  orders(
order_number varchar(50) primary key,
order_date varchar(50),
required_date varchar(50),
shipped_date varchar(50),
status1 varchar (30),
command text,
customer_number varchar(50),foreign key (customer_number) references customers(customer_number));

insert into orders(order_number,order_date,required_date,shipped_date,status1,command,customer_number)
values
  (30001, '2026-01-10', '2026-01-15', '2026-01-13', 'Shipped', 'Delivered on time', 2001),
  (30002, '2026-01-12', '2026-01-18', NULL, 'In Process', NULL, 2002),
  (30003, '2026-01-20', '2026-01-27', '2026-01-25', 'Shipped', 'Customer requested gift wrap', 2003),
  (30004, '2026-02-02', '2026-02-09', '2026-02-06', 'Shipped', NULL, 2004),
  (30005, '2026-02-10', '2026-02-17', '2026-02-15', 'Shipped', 'Fragile items, handled with care', 2005),
  (30006, '2026-02-18', '2026-02-25', NULL, 'Cancelled', 'Customer cancelled due to delay', 2006),
  (30007, '2026-03-01', '2026-03-08', '2026-03-05', 'Shipped', NULL, 2007),
  (30008, '2026-03-10', '2026-03-17', '2026-03-14', 'Shipped', 'Express delivery requested', 2008),
  (30009, '2026-03-22', '2026-03-29', NULL, 'On Hold', 'Awaiting payment confirmation', 2009),
  (30010, '2026-04-05', '2026-04-12', '2026-04-10', 'Shipped', NULL, 2010),
  (30011, '2026-04-15', '2026-04-22', NULL, 'In Process', NULL, 2011),
  (30012, '2026-04-25', '2026-05-02', '2026-04-30', 'Shipped', 'Repeat customer discount applied', 2012);


drop table payments;
create table payments(
customer_number varchar(50),foreign key (customer_number) references customers(customer_number),
check_number varchar(50),
payment_date varchar(50),
ammount decimal(10,2));

insert into payments(customer_number,check_number,payment_date,ammount)
values
  (2001, 'CHK1001', '2026-01-16', 13000),
  (2002, 'CHK1002', '2026-01-17', 12000),
  (2003, 'CHK1003', '2026-01-26', 19500),
  (2004, 'CHK1004', '2026-02-07', 7800),
  (2005, 'CHK1005', '2026-02-16', 11500),
  (2007, 'CHK1006', '2026-03-06', 12000),
  (2008, 'CHK1007', '2026-03-15', 13500),
  (2010, 'CHK1008', '2026-04-11', 5600),
  (2012, 'CHK1009', '2026-05-01', 12000),
  (2001, 'CHK1010', '2026-05-10', 6500),
  (2011, 'CHK1011', '2026-05-15', 9800),
  (2006, 'CHK1012', '2026-05-20', 4000);


drop table customers; 

create table customers(
customer_number varchar(50) primary key,
customer_name varchar(50),
contact_last_name varchar(50),
contact_first_name varchar(50),
phone varchar(50),
address_line1 varchar(50),
address_line2 varchar(50),
city varchar(50),
state varchar(50),
postal_code varchar(50),
country varchar(50), 
salesrep_employeenumber varchar(50),foreign key (salesrep_employeenumber) references employees(employee_number),
credit_limit varchar (50));

insert into customers(customer_number,customer_name,contact_last_name,contact_first_name,phone,address_line1,address_line2,city,state,postal_code,country,salesrep_employeenumber,credit_limit)
values
  (2001, 'ABC Traders', 'Rao', 'Vikram', '+91-9876543210', 'Anna Nagar', NULL, 'Chennai', 'Tamil Nadu', '600040', 'India', 1056, 150000),
  (2002, 'XYZ Electronics', 'Patel', 'Amit', '+91-9123456789', 'Indiranagar', NULL, 'Bangalore', 'Karnataka', '560038', 'India', 1076, 200000),
  (2003, 'Sunrise Collectibles', 'Joshi', 'Meera', '+91-9988776655', 'Bandra West', 'Hill Road', 'Mumbai', 'Maharashtra', '400050', 'India', 1088, 180000),
  (2004, 'Heritage Models', 'Verma', 'Rajesh', '+91-9876012345', 'Karol Bagh', NULL, 'Delhi', 'Delhi', '110005', 'India', 1102, 250000),
  (2005, 'Deccan Hobby House', 'Rao', 'Sandeep', '+91-9011223344', 'Jubilee Hills', NULL, 'Hyderabad', 'Telangana', '500033', 'India', 1143, 175000),
  (2006, 'Pune Model World', 'Kulkarni', 'Sneha', '+91-9822334455', 'FC Road', 'Shivajinagar', 'Pune', 'Maharashtra', '411005', 'India', 1165, 120000),
  (2007, 'Eastern Diecast Hub', 'Chatterjee', 'Arjun', '+91-9933445566', 'Park Street', NULL, 'Kolkata', 'West Bengal', '700016', 'India', 1188, 160000),
  (2008, 'Gujarat Miniatures', 'Desai', 'Hetal', '+91-9898123456', 'CG Road', 'Navrangpura', 'Ahmedabad', 'Gujarat', '380009', 'India', 1216, 140000),
  (2009, 'Royal Replicas', 'Rathore', 'Devendra', '+91-9414012345', 'C Scheme', NULL, 'Jaipur', 'Rajasthan', '302005', 'India', 1230, 130000),
  (2010, 'Coastal Collectors', 'Menon', 'Lakshmi', '+91-9847012345', 'MG Road', 'Ernakulam', 'Kochi', 'Kerala', '682035', 'India', 1245, 110000),
  (2011, 'Metro Scale Models', 'Khanna', 'Sahil', '+91-9810123456', 'Lajpat Nagar', NULL, 'Delhi', 'Delhi', '110024', 'India', 1260, 220000),
  (2012, 'Silicon Toys & Models', 'Hegde', 'Divya', '+91-9886123456', 'Koramangala', '5th Block', 'Bangalore', 'Karnataka', '560095', 'India', 1076, 190000);

drop table employees;
create table employees(
employee_number varchar(50) primary key,
last_name varchar(50),
first_name varchar(50),
extension varchar(50),
email varchar(50),
office_code varchar(50), foreign key (office_code) references offices(office_code),
reports_to varchar(50),
job_title varchar(50));

insert into employees(employee_number,last_name,first_name,extension,email,office_code,reports_to,job_title)
value
  (1002, 'Kumar', 'Arun', 'x101', 'arun.kumar@classic.com', '1', NULL, 'Sales Manager'),
  (1056, 'Ravi', 'Suresh', 'x102', 'suresh.ravi@classic.com', '1', 1002, 'Sales Rep'),
  (1076, 'Sharma', 'Neha', 'x103', 'neha.sharma@classic.com', '2', 1002, 'Sales Rep'),
  (1088, 'Iyer', 'Priya', 'x104', 'priya.iyer@classic.com', '3', 1002, 'Sales Rep'),
  (1102, 'Mehta', 'Rohan', 'x105', 'rohan.mehta@classic.com', '4', 1002, 'Sales Rep'),
  (1143, 'Reddy', 'Kavya', 'x106', 'kavya.reddy@classic.com', '5', 1002, 'Sales Rep'),
  (1165, 'Deshpande', 'Aditya', 'x107', 'aditya.deshpande@classic.com', '6', 1002, 'Sales Rep'),
  (1188, 'Banerjee', 'Riya', 'x108', 'riya.banerjee@classic.com', '7', 1002, 'Sales Rep'),
  (1216, 'Shah', 'Karan', 'x109', 'karan.shah@classic.com', '8', 1002, 'Sales Rep'),
  (1230, 'Singh', 'Pooja', 'x110', 'pooja.singh@classic.com', '9', 1002, 'Sales Rep'),
  (1245, 'Nair', 'Vishnu', 'x111', 'vishnu.nair@classic.com', '10', 1002, 'Sales Rep'),
  (1260, 'Gupta', 'Ananya', 'x112', 'ananya.gupta@classic.com', '4', 1002, 'Sales Rep');

drop table offices;
create table offices(
office_code varchar(50) primary key,
city varchar(50),
phone varchar(50),
address_line1 varchar(50),
address_line2 varchar(50),
state varchar(50),
country varchar(50),
postal_code varchar(50),
territory varchar (50));

insert into offices(office_code,city,phone,address_line1,address_line2,state,country,postal_code,territory)
values
  ('1', 'Chennai', '+91-44-12345678', 'T Nagar', NULL, 'Tamil Nadu', 'India', '600017', 'APAC'),
  ('2', 'Bangalore', '+91-80-87654321', 'MG Road', NULL, 'Karnataka', 'India', '560001', 'APAC'),
  ('3', 'Mumbai', '+91-22-23456789', 'Andheri East', 'Marol', 'Maharashtra', 'India', '400059', 'APAC'),
  ('4', 'Delhi', '+91-11-34567890', 'Connaught Place', NULL, 'Delhi', 'India', '110001', 'APAC'),
  ('5', 'Hyderabad', '+91-40-45678901', 'Banjara Hills', 'Road No 12', 'Telangana', 'India', '500034', 'APAC'),
  ('6', 'Pune', '+91-20-56789012', 'Koregaon Park', NULL, 'Maharashtra', 'India', '411001', 'APAC'),
  ('7', 'Kolkata', '+91-33-67890123', 'Salt Lake Sector V', NULL, 'West Bengal', 'India', '700091', 'APAC'),
  ('8', 'Ahmedabad', '+91-79-78901234', 'SG Highway', 'Bodakdev', 'Gujarat', 'India', '380054', 'APAC'),
  ('9', 'Jaipur', '+91-141-8901234', 'MI Road', NULL, 'Rajasthan', 'India', '302001', 'APAC'),
  ('10', 'Kochi', '+91-484-9012345', 'Marine Drive', NULL, 'Kerala', 'India', '682031', 'APAC')
;