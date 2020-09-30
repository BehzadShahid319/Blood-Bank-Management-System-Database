create table donor(
D_id int NOT NULL Primary key,
D_Name varchar(30) not null,
D_age int Not NUll,
D_gender varchar(20) Not null,
D_address varchar(30),
D_Pnumber varchar(20) Not Null,
D_date date Not NUll,
B_id int foreign key references Blood(B_id)
)
create trigger tri_donor
on donor 
after update
as
insert into history_donor select * from donor

create table history_donor(
D_id int foreign key references Donor(D_id),
D_Name varchar(30) not null,
D_age int Not NUll,
D_gender varchar(20) Not null,
D_Pnumber varchar(20) Not Null,
D_date date Not NUll,
B_id int foreign key references Blood(B_id)
)
alter table donor
drop column D_address

alter table history_donor
add 
BB_id int foreign key references Blood_Bank(BB_id)

alter table Blood_inventory
drop column BI_date


create table Blood(
B_id int NOT NULL primary key,
B_type varchar(10),
)

create table History_Blood(
B_id int foreign key references Blood(B_id),
B_type varchar(10),
)
insert into History_Blood select * from Blood
//*Trigger for updating in Blood*//

create trigger tr_Blood
on Blood
after update
as
insert into History_Blood select * from Blood

//* trigger end*//

create table Blood_inventory (
BI_no int NOT NULL primary key,
BI_quantity int NOT NULL,
B_id int foreign key references Blood(B_id),
BB_id int foreign key references Blood_Bank(BB_id)
)

create table Blood_inventory (
BI_no int NOT NULL primary key,
BI_quantity int NOT NULL,
B_id int foreign key references Blood(B_id),
BB_id int foreign key references Blood_Bank(BB_id)
)
select * from Blood_inventory
alter table blood_inventory 
add BI_date date not null 


create table History_Blood_inventory (
BI_no int foreign key references Blood_Inventory(BI_no),
BI_quantity int NOT NULL,
B_id int foreign key references Blood(B_id),
BB_id int foreign key references Blood_Bank(BB_id),
BI_date date not null 
)
alter table  history_blood_inventory
alter column bi_date date null


create table history_History_Blood_inventory (
BI_no int foreign key references Blood_Inventory(BI_no),
BI_quantity int NOT NULL,
B_id int foreign key references Blood(B_id),
BB_id int foreign key references Blood_Bank(BB_id),
BI_date date null 
)

//* Triggers *//

create trigger trrr_history
on history_blood_inventory
instead of delete 
as
insert into history_History_Blood_inventory select * from History_Blood_inventory




//*Trigger for insertion*//
alter trigger tr1_blood_inventory
on blood_inventory
for delete
as
insert  into history_history_blood_inventory select * from deleted


//*trigger end*//

//*Trigger for updating*//
create trigger tr_blood_inventory
on blood_inventory
after update
as 
insert into History_blood_inventory select *from Blood_inventory

//*trigger end*//

create table Blood_Bank(
BB_id int NOT NULL primary key,
BB_contact varchar(20),
BB_address varchar(30),
H_id int foreign key references Hospital(H_id)
)

create table Hospital(
H_id int Not Null primary key,
H_name varchar(20) Not null,
H_address varchar(30) Not null,
H_contact varchar(20) not null,
)
create table Donation(
D_id int Not null primary key,
D_quantity int not null,
B_id int foreign key references Blood(B_id),
R_id int foreign key references Reciever(R_id),
IM_id int foreign key references Inventory_Manager(IM_id),
)
alter table donation
add 
BB_id int foreign key references Blood_Bank(BB_id)

alter table donation
add D_date date

create table history_Donation(
D_id int foreign key references Donation(D_id),
D_quantity int not null,
B_id int foreign key references Blood(B_id),
R_id int foreign key references Reciever(R_id),
IM_id int foreign key references Inventory_Manager(IM_id),
BB_id int foreign key references Blood_Bank(BB_id),
D_date date
)
//*Trigger start*//

create trigger tr_donation
on donation
for insert
as
insert into history_Donation select * from Donation

create trigger tr1_donation
on donation
for update
as
insert into history_Donation select * from Donation

//*trigger end *//

create table Reciever(
R_id int NOT NULL Primary key,
R_Name varchar(30) Not null,
R_age int Not NUll,
R_gender varchar(20) Not null,
R_address varchar(30),
R_Pnumber varchar(20) Not Null,
R_date date Not NUll,
)
drop table reciever

create table history_Reciever(
R_id int foreign key references Reciever(R_id),
R_Name varchar(30) Not null,
R_age int Not NUll,
R_gender varchar(20) Not null,
R_address varchar(30),
R_Pnumber varchar(20) Not Null,
R_date date Not NUll,
) 
alter table history_reciever
drop column R_address



//* triggers start*//
create trigger tr_Reciever
on reciever
for insert
as
insert into history_Reciever select * from Reciever

create trigger tr1_Reciever
on reciever
for update
as
insert into history_Reciever select * from Reciever
//*triggers end*//

create table Inventory_Manager(
IM_ID int Not null primary key,
IM_name varchar(20) Not null,
IM_address Varchar (30) not null,
IM_contact varchar(20) not null,
IM_date_of_joining date,
IM_date_of_leaviing date
)
alter table inventory_manager
add 
BB_id int foreign key references Blood_Bank(BB_id)

create table history_Inventory_Manager(
IM_ID int foreign key references inventory_manager(im_id),
IM_name varchar(20) Not null,
IM_address Varchar (30) not null,
IM_contact varchar(20) not null,
IM_date_of_joining date,
IM_date_of_leaviing date
)
alter table history_inventory_manager
add 
BB_id int foreign key references Blood_Bank(BB_id)

truncate table history_inventory_manager
//* triggers start*//
create trigger tr_inventory_manager
on reciever
for insert
as
insert into history_inventory_manager select * from Inventory_Manager

create trigger tr1_inventory_manager
on reciever
for update
as
insert into history_inventory_manager select * from Inventory_Manager
//*triggers end*//

insert into Blood values( 1001 , 'A+')
insert into Blood values( 1002 , 'A-')
insert into Blood values( 1003 , 'B+')
insert into Blood values( 1004 , 'B-')
insert into Blood values( 1005 , 'AB+')
insert into Blood values( 1006 , 'AB-')
insert into Blood values( 1007 , 'O+')
insert into Blood values( 1008 , 'O-')

select * from Blood

select distinct * from history_blood_inventory
insert into Hospital values(0001, 'Shalamar Hospital', 'Link road mughalpura' , '042-36817857')
insert into Hospital values(0002, 'Gulab Devi Hospital', 'Ferozepur Road Lahore' , '042-99230247')
insert into Hospital values(0003, 'Rasheed Hospital', 'Main Boulevard Defence Lahore' , '042-336673192')
insert into Hospital values(0004, 'National Hospital ', 'L-Block, LCCHS Lahore Cantt.' , '042-35728759')
insert into Hospital values(0005, 'CMH Hospital', 'CMH Lahore Cantt., Lahore' , '042-6699111')
insert into Hospital values(0006, 'Cavalry Hospital', '44-45, Cavalry Ground Lahore' , '042-36652116')
insert into Hospital values(0007, 'Farooq Hospital', '2 Asif Block,Iqbal Town' , '042-37813471')
insert into Hospital values(0008, 'Ittefaq Hospital', 'H. Block Model Town, Lahore' , '042-35881981')
insert into Hospital values(0009, 'Al-Ahsan Hospital', '142, Murree Road, Rawalpindi.' , '051-5515409')
insert into Hospital values(0010, 'Noor Hospital', 'Fateh Jung Road,Islamabad.' , '051-2295383')

Select * from Hospital

insert into Blood_Bank values ('90001',' 042-35651343','1st floor H_block', '10')
insert into Blood_Bank values ('90002',' 042-68797696','Ground floor C block', '7')
insert into Blood_Bank values ('90003',' 042-46547745','2nd floor H block', '1')
insert into Blood_Bank values ('90004',' 042-97865943','2nd floor F block', '6')
insert into Blood_Bank values ('90005',' 042-94374242','1st floor B block', '3')
insert into Blood_Bank values ('90006',' 042-23414323','Ground floor B block', '9')
insert into Blood_Bank values ('90007',' 042-03432211','1st floor', '4')
insert into Blood_Bank values ('90008',' 042-32343485','3rd floor block H', '2')
insert into Blood_Bank values ('90009',' 042-42321432','2nd floor J block', '5')
insert into Blood_Bank values ('90010',' 042-69504053','Ground floor C block', '8')

select * from Blood_Bank

select * from inventory_manager
select * from Blood_inventory
insert into Inventory_Manager values(3001, 'Sayyam Shaukat', 'askari 9 lahore', '0346-2361722', '2019-01-01', null)
update Inventory_Manager set BB_id=90001 where im_id=3001
insert into Inventory_Manager values(3002, 'Abdul rehman', 'Askari 10 lahore', '0326-2399822', '2019-01-01', null,90002)
insert into Inventory_Manager values(3003, 'Basit ', ' Lahore Cantt', '0316-2331922', '2019-01-01', null,90003)
insert into Inventory_Manager values(3004, 'Faisal Mumtazz', 'Mughalpura, lahore', '0306-7353221', '2019-01-01', null,90004)
insert into Inventory_Manager values(3005, 'Burhan Tahir', 'Harbanspura,Lahore', '0321-2283722', '2019-01-01', null,90005)
insert into Inventory_Manager values(3006, 'Abdullah Zahid', 'Mall Road, Lahore', '0321-2398722', '2019-01-01', null,90006)
insert into Inventory_Manager values(3007, 'Isam Shahid', 'Canal View, Lahore', '0327-9367722', '2019-01-01', null,90007)
insert into Inventory_Manager values(3008, 'Hadi khan', 'Johar Town, Lahore', '0319-9361722', '2019-01-01', null,90008)
insert into Inventory_Manager values(3009, 'Mustafa Siddique', 'Wapda Town, lahore', '0313-9861722', '2019-01-01', null, 90009)
insert into Inventory_Manager values(3010, 'Abid sohail', 'Wapda Town, Lahore', '0342-2364222', '2019-01-01', null, 90010)

insert into donor values (101, 'Hammad Shaukat', 23, 'Male', '0340-2167452', '2019-12-01', 1001, 90004)
insert into donor values (102, 'Ali Azzan', 21, 'Male', '0301-2123455', '2019-12-01',1001, 90004)
insert into donor values (103, 'Hammad Riaz', 19, 'Male', '0347-2267659', '2019-12-01',1002, 90003)
insert into donor values (104, 'Behzad Shadid', 27, 'Male', '0324-2362493', '2019-12-01',1004, 90006)
insert into donor values (105, 'Mubariz Ali', 33, 'Male', '0310-2672452', '2019-12-01',1008,90004)
insert into donor values (106, 'Talha Imtiaz', 21, 'Male', '0330-6147224', '2019-12-01',1002,90005)
insert into donor values (107, 'Burhan Sabir', 25, 'Male', '0315-1637423', '2019-12-01',1005,90008)
insert into donor values (108, 'Safa Haroon', 21, 'Female', '0331-4268522', '2019-12-01',1002,90010)
insert into donor values (109, 'Myra Tariq', 20, 'Female', '0345-2125732', '2019-12-01',1004, 90002)
insert into donor values (110, 'Awais Manzoor', 32, 'Male', '0342-2321668', '2019-12-01',1001,90001)
insert into donor values (111, 'Talha Nasir', 22, 'Male', '0314-2152267', '2019-12-01',1007,90002)
insert into donor values (112, 'Ibad Ahmad', 29, 'Male', '0307-1637242', '2019-12-01',1002,90001)

select * from donor
select * from Blood_Bank
select * from Blood_inventory

select sum(BI_Quantity) from Blood_inventory


insert into donor values (113, 'Hammad Ali', 25, 'Male', '0304-2167452', '2019-12-02', 1001, 90004)
update Blood_inventory set BI_quantity=BI_quantity+1 where B_id=1001 and BB_id= 90004
update Blood_inventory set BI_date='2019-12-02'where B_id=1001 and BB_id= 90004
insert into donor values (114, 'Azzan Malik', 31, 'Male', '0313-8123455', '2019-12-02',1002, 90003)
update Blood_inventory set BI_date='2019-12-02'where B_id=1002 and BB_id= 90003
update Blood_inventory set BI_quantity=BI_quantity+1 where B_id=1002 and BB_id= 90003
insert into donor values (115, 'Riaz Ahmad', 49, 'Male', '0317-2767959', '2019-12-02',1004, 90009)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-02' where B_id=1004 and BB_id= 90009
insert into donor values (116, 'Shadid Khan', 47, 'Male', '0342-2392493', '2019-12-02',1007, 90006)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-02' where B_id=1007 and BB_id= 90006
insert into donor values (117, 'Ali Ghauri', 23, 'Male', '0317-2692452', '2019-12-02',1008,90004)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-02' where B_id=1008 and BB_id= 90004
insert into donor values (118, 'Imtiaz Hassan', 41, 'Male', '0320-6197224', '2019-12-02',1002,90005)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-02' where B_id=1002 and BB_id= 90005
insert into donor values (119, 'Sabir Khan', 35, 'Male', '0315-1637493', '2019-12-02',1007,90010)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-02' where B_id=1007 and BB_id= 90010
insert into donor values (120, 'Haroon Rasheed', 21, 'Male', '0321-4253522', '2019-12-03',1004,90005)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-03' where B_id=1004 and BB_id= 90005
insert into donor values (121, 'Tariq Mahmood', 22, 'Male', '0341-4129732', '2019-12-03',1002, 90006)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-03' where B_id=1002 and BB_id= 90006
insert into donor values (122, 'Manzoor Iqbal', 26, 'Male', '0312-2361668', '2019-12-03',1008,90001)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-03' where B_id=1008 and BB_id= 90001
insert into donor values (123, 'Nasir Khan', 24, 'Male', '0317-2152567', '2019-12-03',1007,90002)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-03' where B_id=1007 and BB_id= 90002
insert into donor values (124, 'Ahmad tariq', 39, 'Male', '0337-1697282', '2019-12-03',1002,90004)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-03' where B_id=1002 and BB_id= 90004


insert into donor values (125, 'Shaukat Iqbal', 33, 'Male', '0340-2197451', '2019-12-04', 1006, 90003)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-04' where B_id=1006 and BB_id= 90003
insert into donor values (126, 'Aliya khan', 19, 'Female', '0311-2193555', '2019-12-04',1002, 90002)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-04' where B_id=1002 and BB_id= 90002
insert into donor values (127, 'Aizaz Hassan', 39, 'Male', '0307-2257859', '2019-12-04',1002, 90009)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-04' where B_id=1002 and BB_id= 90009
insert into donor values (128, 'Zahid Iqbal', 27, 'Male', '0346-2962993', '2019-12-04',1004, 90007)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-04' where B_id=1004 and BB_id= 90007
insert into donor values (129, 'Arzu Malik', 43, 'Female', '0314-2632252', '2019-12-04',1008,90010)
update Blood_inventory set BI_quantity=BI_quantity+1 ,BI_date='2019-12-04'where B_id=1008 and BB_id= 90010
insert into donor values (130, 'Hareem Shah', 21, 'Female', '0332-6372242', '2019-12-04',1002,90001)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-04' where B_id=1002 and BB_id= 90001
insert into donor values (131, 'Haya Rajpoot', 25, 'Female', '0335-1687923', '2019-12-05',1005,90002)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-05' where B_id=1005 and BB_id= 90002
insert into donor values (132, 'Nabia Imran', 23, 'Female', '0321-4298512', '2019-12-05',1004,90001)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-05' where B_id=1004 and BB_id= 90001
insert into donor values (133, 'Sara butt', 25, 'Female', '0303-2925932', '2019-12-05',1005, 90005)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-05' where B_id=1005 and BB_id= 90005
insert into donor values (134, 'Mahnoor Amir', 22, 'Female', '0324-2391968', '2019-12-05',1001,90008)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-05' where B_id=1001 and BB_id= 90008
insert into donor values (135, 'Saboor Azeem', 25, 'Male', '0304-9159267', '2019-12-05',1007,90005)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-05' where B_id=1007 and BB_id= 90005
insert into donor values (136, 'Danish Khan', 39, 'Male', '0327-2697292', '2019-12-05',1004,90005)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-05' where B_id=1004 and BB_id= 90005


insert into donor values (137, 'Abdul Rehman', 31, 'Male', '0316-2167452', '2019-12-06', 1001, 90004)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-06' where B_id=1001 and BB_id= 90004
insert into donor values (138, 'Fawad rana', 26, 'Male', '0321-2123455', '2019-12-06',1001, 90006)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-06' where B_id=1001 and BB_id= 90006
insert into donor values (139, 'Wasif imtiaz', 29, 'Male', '0327-2267659', '2019-12-06',1002, 90005)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-06' where B_id=1002 and BB_id= 90005
insert into donor values (140, 'Shahroz Akhtar', 24, 'Male', '0342-2362493', '2019-12-06',1001, 90006)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-06' where B_id=1001 and BB_id= 90006
insert into donor values (141, 'Sana Munir', 23, 'Female', '0301-2672452', '2019-12-06',1001,90004)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-06' where B_id=1001 and BB_id= 90004
insert into donor values (142, 'Tayyab khan', 21, 'Male', '0303-6147224', '2019-12-06',1002,90005)
update Blood_inventory set BI_quantity=BI_quantity+1,BI_date='2019-12-06' where B_id=1002 and BB_id= 90005
insert into donor values (143, 'Komal Abid', 25, 'Female', '0316-1637423', '2019-12-06',1005,90010)
update Blood_inventory set BI_quantity=BI_quantity+1 , BI_date='2019-12-06'where B_id=1005 and BB_id= 90010
insert into donor values (144, 'Rameez Karamat', 31, 'Male', '0334-4269522', '2019-12-07',1003,90003)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-07' where B_id=1003 and BB_id= 90003
insert into donor values (145, 'Sharjeel Dogar', 30, 'Male', '0346-2125732', '2019-12-07',1004, 90005)
update Blood_inventory set BI_quantity=BI_quantity+1 , BI_date='2019-12-07'where B_id=1004 and BB_id= 90005
insert into donor values (146, 'Mujataba Shabbir', 32, 'Male', '0314-2321668', '2019-12-07',1008,90001)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-07' where B_id=1008 and BB_id= 90001
insert into donor values (147, 'Salman Mujahid', 32, 'Male', '0304-2152267', '2019-12-07',1002,90002)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-07' where B_id=1002 and BB_id= 90002
insert into donor values (148, 'Umair Khalid', 39, 'Male', '0317-1697242', '2019-12-07',1003,90004)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-07' where B_id=1003 and BB_id= 90004


insert into donor values (149, 'Aqib Javed', 28, 'Male', '0310-4162452', '2019-12-08', 1001, 90004)
update Blood_inventory set BI_quantity=BI_quantity+1 ,BI_date='2019-12-08'where B_id=1001 and BB_id= 90004
insert into donor values (150, 'Nouman Khan', 24, 'Male', '0311-2133555', '2019-12-08',1001, 90004)
update Blood_inventory set BI_quantity=BI_quantity+1 ,BI_date='2019-12-08'where B_id=1001 and BB_id= 90004
insert into donor values (151, 'Tariq Jameel', 29, 'Male', '0340-2247259', '2019-12-08',1002, 90003)
update Blood_inventory set BI_quantity=BI_quantity+1 ,BI_date='2019-12-08'where B_id=1002 and BB_id= 90003
insert into donor values (152, 'Hassan Awan', 21, 'Male', '0334-2322393', '2019-12-08',1004, 90006)
update Blood_inventory set BI_quantity=BI_quantity+1 ,BI_date='2019-12-08'where B_id=1004 and BB_id= 90006
insert into donor values (153, 'Talal Chaudary', 33, 'Male', '0335-2672452', '2019-12-08',1008,90004)
update Blood_inventory set BI_quantity=BI_quantity+1 ,BI_date='2019-12-08'where B_id=1008 and BB_id= 90004
insert into donor values (154, 'Asad Mansoor', 21, 'Male', '0340-6147594', '2019-12-08',1002,90005)
update Blood_inventory set BI_quantity=BI_quantity+1 ,BI_date='2019-12-08'where B_id=1002 and BB_id= 90005
insert into donor values (155, 'Khizar Nasir', 25, 'Male', '0325-163343', '2019-12-08',1005,90008)
update Blood_inventory set BI_quantity=BI_quantity+1 , BI_date='2019-12-08'where B_id=1005 and BB_id= 90008
insert into donor values (156, 'Fatima Ahmad', 22, 'Female', '0332-4268522', '2019-12-08',1002,90010)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-08' where B_id=1002 and BB_id= 90010
insert into donor values (157, 'Laiba Khan', 24, 'Female', '0335-2135732', '2019-12-08',1004, 90002)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-08' where B_id=1004 and BB_id= 90002
insert into donor values (158, 'Safa Munawar', 31, 'Female', '0323-2321468', '2019-12-08',1001,90001)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-08' where B_id=1001 and BB_id= 90001
insert into donor values (159, 'Faizan Khan', 22, 'Male', '0324-2153267', '2019-12-09',1007,90002)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-09' where B_id=1007 and BB_id= 90002
insert into donor values (160, 'Samrah Khan', 23, 'Female', '0327-1627292', '2019-12-09',1002,90001)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-09' where B_id=1002 and BB_id= 90001
insert into donor values (161, 'Sumaira ali', 24, 'Female', '0307-0627292', '2019-12-09',1005,90001)
update Blood_inventory set BI_quantity=BI_quantity+1, BI_date='2019-12-09' where B_id=1005 and BB_id= 90001


insert into Blood_inventory values (70001, 1, 1001, 90001,'2019-12-01')
insert into Blood_inventory values (70002, 0, 1001, 90002,'2019-12-01')
insert into Blood_inventory values (70003, 0, 1001, 90003,'2019-12-01')
insert into Blood_inventory values (70004, 2, 1001, 90004,'2019-12-01')
insert into Blood_inventory values (70005, 0, 1001, 90005,'2019-12-01')
insert into Blood_inventory values (70006, 0, 1001, 90006,'2019-12-01')
insert into Blood_inventory values (70007, 0, 1001, 90007,'2019-12-01')
insert into Blood_inventory values (70008, 0, 1001, 90008,'2019-12-01')
insert into Blood_inventory values (70009, 0, 1001, 90009,'2019-12-01')
insert into Blood_inventory values (70010, 0, 1001, 90010,'2019-12-01')
insert into Blood_inventory values (70011, 1, 1002, 90001,'2019-12-01')
insert into Blood_inventory values (70012, 0, 1002, 90002,'2019-12-01')
insert into Blood_inventory values (70013, 1, 1002, 90003,'2019-12-01')
insert into Blood_inventory values (70014, 0, 1002, 90004,'2019-12-01')
insert into Blood_inventory values (70015, 1, 1002, 90005,'2019-12-01')
insert into Blood_inventory values (70016, 0, 1002, 90006,'2019-12-01')
insert into Blood_inventory values (70017, 0, 1002, 90007,'2019-12-01')
insert into Blood_inventory values (70018, 0, 1002, 90008,'2019-12-01')
insert into Blood_inventory values (70019, 0, 1002, 90009,'2019-12-01')
insert into Blood_inventory values (70020, 1, 1002, 90010,'2019-12-01')
insert into Blood_inventory values (70021, 0, 1003, 90001,'2019-12-01')
insert into Blood_inventory values (70022, 0, 1003, 90002,'2019-12-01')
insert into Blood_inventory values (70023, 0, 1003, 90003,'2019-12-01')
insert into Blood_inventory values (70024, 0, 1003, 90004,'2019-12-01')
insert into Blood_inventory values (70025, 0, 1003, 90005,'2019-12-01')
insert into Blood_inventory values (70026, 0, 1003, 90006,'2019-12-01')
insert into Blood_inventory values (70027, 0, 1003, 90007,'2019-12-01')
insert into Blood_inventory values (70028, 0, 1003, 90008,'2019-12-01')
insert into Blood_inventory values (70029, 0, 1003, 90009,'2019-12-01')
insert into Blood_inventory values (70030, 0, 1003, 90010,'2019-12-01')
insert into Blood_inventory values (70031, 0, 1004, 90001,'2019-12-01')
insert into Blood_inventory values (70032, 1, 1004, 90002,'2019-12-01')
insert into Blood_inventory values (70033, 0, 1004, 90003,'2019-12-01')
insert into Blood_inventory values (70034, 0, 1004, 90004,'2019-12-01')
insert into Blood_inventory values (70035, 0, 1004, 90005,'2019-12-01')
insert into Blood_inventory values (70036, 1, 1004, 90006,'2019-12-01')
insert into Blood_inventory values (70037, 0, 1004, 90007,'2019-12-01')
insert into Blood_inventory values (70038, 0, 1004, 90008,'2019-12-01')
insert into Blood_inventory values (70039, 0, 1004, 90009,'2019-12-01')
insert into Blood_inventory values (70040, 0, 1004, 90010,'2019-12-01')

insert into Blood_inventory values (70041, 0, 1005, 90001,'2019-12-01')
insert into Blood_inventory values (70042, 0, 1005, 90002,'2019-12-01')
insert into Blood_inventory values (70043, 0, 1005, 90003,'2019-12-01')
insert into Blood_inventory values (70044, 0, 1005, 90004,'2019-12-01')
insert into Blood_inventory values (70045, 0, 1005, 90005,'2019-12-01')
insert into Blood_inventory values (70046, 0, 1005, 90006,'2019-12-01')
insert into Blood_inventory values (70047, 0, 1005, 90007,'2019-12-01')
insert into Blood_inventory values (70048, 1, 1005, 90008,'2019-12-01')
insert into Blood_inventory values (70049, 0, 1005, 90009,'2019-12-01')
insert into Blood_inventory values (70050, 0, 1005, 90010,'2019-12-01')

insert into Blood_inventory values (70051, 0, 1006, 90001,'2019-12-01')
insert into Blood_inventory values (70052, 0, 1006, 90002,'2019-12-01')
insert into Blood_inventory values (70053, 0, 1006, 90003,'2019-12-01')
insert into Blood_inventory values (70054, 0, 1006, 90004,'2019-12-01')
insert into Blood_inventory values (70055, 0, 1006, 90005,'2019-12-01')
insert into Blood_inventory values (70056, 0, 1006, 90006,'2019-12-01')
insert into Blood_inventory values (70057, 0, 1006, 90007,'2019-12-01')
insert into Blood_inventory values (70058, 0, 1006, 90008,'2019-12-01')
insert into Blood_inventory values (70059, 0, 1006, 90009,'2019-12-01')
insert into Blood_inventory values (70060, 0, 1006, 90010,'2019-12-01')

insert into Blood_inventory values (70061, 0, 1007, 90001,'2019-12-01')
insert into Blood_inventory values (70062, 1, 1007, 90002,'2019-12-01')
insert into Blood_inventory values (70063, 0, 1007, 90003,'2019-12-01')
insert into Blood_inventory values (70064, 0, 1007, 90004,'2019-12-01')
insert into Blood_inventory values (70065, 0, 1007, 90005,'2019-12-01')
insert into Blood_inventory values (70066, 0, 1007, 90006,'2019-12-01')
insert into Blood_inventory values (70067, 0, 1007, 90007,'2019-12-01')
insert into Blood_inventory values (70068, 0, 1007, 90008,'2019-12-01')
insert into Blood_inventory values (70069, 0, 1007, 90009,'2019-12-01')
insert into Blood_inventory values (70070, 0, 1007, 90010,'2019-12-01')

insert into Blood_inventory values (70071, 0, 1008, 90001,'2019-12-01')
insert into Blood_inventory values (70072, 0, 1008, 90002,'2019-12-01')
insert into Blood_inventory values (70073, 0, 1008, 90003,'2019-12-01')
insert into Blood_inventory values (70074, 1, 1008, 90004,'2019-12-01')
insert into Blood_inventory values (70075, 0, 1008, 90005,'2019-12-01')
insert into Blood_inventory values (70076, 0, 1008, 90006,'2019-12-01')
insert into Blood_inventory values (70077, 0, 1008, 90007,'2019-12-01')
insert into Blood_inventory values (70078, 0, 1008, 90008,'2019-12-01')
insert into Blood_inventory values (70079, 0, 1008, 90009,'2019-12-01')
insert into Blood_inventory values (70080, 0, 1008, 90010,'2019-12-01')

insert into reciever values (3101, 'Hammad Shaukat', 23, 'Male', '0340-2167452', '2019-12-07')
insert into Reciever values (3102, 'Ali Azzan', 21, 'Male', '0301-2123455', '2019-12-07')
insert into Reciever values (3103, 'Hammad Riaz', 19, 'Male', '0347-2267659', '2019-12-07')
insert into Reciever values (3104, 'Behzad Shadid', 27, 'Male', '0324-2362493', '2019-12-07')
insert into Reciever values (3105, 'Mubariz Ali', 33, 'Male', '0310-2672452', '2019-12-07')
insert into Reciever values (3106, 'Talha Imtiaz', 21, 'Male', '0330-6147224', '2019-12-07')
insert into Reciever values (3107, 'Burhan Sabir', 25, 'Male', '0315-1637423', '2019-12-07')
insert into Reciever values (3108, 'Safa Haroon', 21, 'Female', '0331-4268522', '2019-12-08')
insert into Reciever values (3109, 'Myra Tariq', 20, 'Female', '0345-2125732', '2019-12-08')
insert into Reciever values (3110, 'Awais Manzoor', 32, 'Male', '0342-2321668', '2019-12-08')
insert into Reciever values (3111, 'Talha Nasir', 22, 'Male', '0314-2152267', '2019-12-08')
insert into Reciever values (3112, 'Ibad Ahmad', 29, 'Male', '0307-1637242', '2019-12-08')

insert into Donation values(6000, 2, 1001, 3101, 3004  , 90004, '07-12-2019')
update Blood_inventory set BI_quantity=BI_quantity-2 where BB_id= 90004 and B_id=1001

insert into Donation values(6001, 1, 1001, 3102, 3001  , 90001, '2019-12-10')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-10' where BB_id= 90001 and B_id=1001
insert into Donation values(6002, 1, 1001, 3103, 3006  , 90006, '2019-12-10')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-10' where BB_id= 90006 and B_id=1001
insert into Donation values(6003, 1, 1001, 3104, 3004  , 90004, '2019-12-10')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-10' where BB_id= 90004 and B_id=1001
insert into Donation values(6004, 1, 1007, 3105, 3002  , 90002, '2019-12-10')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-10' where BB_id= 90002 and B_id=1007

insert into Donation values(6005, 1, 1008, 3106, 3004  , 90004, '10-12-2019')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-10' where BB_id= 90004 and B_id=1008

insert into Donation values(6006, 1, 1008, 3107, 3001  , 90001, '2019-12-10')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-10' where BB_id= 90001 and B_id=1008

insert into Donation values(6007, 1, 1005, 3108, 3005  , 90005, '2019-12-10')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-10' where BB_id= 90005 and B_id=1005

insert into Donation values(6008, 1, 1005, 3109, 3008  , 90008, '2019-12-10')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-10' where BB_id= 90008 and B_id=1005

insert into Donation values(6009, 1, 1001, 3110, 3004  , 90004, '2019-12-10')
update Blood_inventory set BI_quantity=BI_quantity-2 where BB_id= 90004 and B_id=1001

insert into Donation values(6010, 1, 1004, 3101, 3005  , 90005, '2019-12-10')
update Blood_inventory set BI_quantity=BI_quantity-1 , BI_date='2019-12-10'where BB_id= 90005 and B_id=1004
update Donation set D_date= '2019-12-10' where  D_id=6005

select * from Donation
select sum(D_quantity) from Donation
select sum(bi_quantity) from Blood_inventory 

insert into Donation values(6011, 1, 1001, 3103, 3004  , 90004, '2019-12-11')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-11' where BB_id= 90004 and B_id=1001

insert into Donation values(6012, 1, 1004, 3104, 3002  , 90002, '2019-12-11')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-11' where BB_id= 90002 and B_id=1004

insert into Donation values(6013, 1, 1004, 3102, 3005  , 90005, '2019-12-11')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-11' where BB_id= 90005 and B_id=1004

insert into Donation values(6014, 1, 1007, 3109, 3002  , 90002, '2019-12-11')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-11' where BB_id= 90002 and B_id=1007

insert into Donation values(6015, 1, 1008, 3103, 3004  , 90004, '2019-12-11')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-11' where BB_id= 90004 and B_id=1008






insert into Reciever values (3113, 'Abdul Rehman', 31, 'Male', '0316-2167452', '2019-12-12')
insert into Reciever values (3114, 'Fawad rana', 26, 'Male', '0321-2123455', '2019-12-12')
insert into Reciever values (3115, 'Wasif imtiaz', 29, 'Male', '0327-2267659', '2019-12-12')
insert into Reciever values (3116, 'Shahroz Akhtar', 24, 'Male', '0342-2362493', '2019-12-12')
insert into Reciever values (3117, 'Sana Munir', 23, 'Female', '0301-2672452', '2019-12-12')
insert into Reciever values (3118, 'Tayyab khan', 21, 'Male', '0303-6147224', '2019-12-12')
insert into Reciever values (3119, 'Komal Abid', 25, 'Female', '0316-1637423', '2019-12-12')
insert into Reciever values (3120, 'Rameez Karamat', 31, 'Male', '0334-4269522', '2019-12-12')
insert into Reciever values (3121, 'Sharjeel Dogar', 30, 'Male', '0346-2125732', '2019-12-12')
insert into Reciever values (3122, 'Mujataba Shabbir', 32, 'Male', '0314-2321668', '2019-12-12')
insert into Reciever values (3123, 'Salman Mujahid', 32, 'Male', '0304-2152267', '2019-12-12')
insert into Reciever values (3124, 'Umair Khalid', 39, 'Male', '0317-1697242', '2019-12-12')





insert into Donation values(6016, 1, 1001, 3113, 3001  , 90001, '2019-12-12')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-12' where BB_id= 90001 and B_id=1001

insert into Donation values(6017, 1, 1001, 3114, 3004  , 90004, '2019-12-12')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-12' where BB_id= 90004 and B_id=1001

insert into Donation values(6018, 1, 1002, 3115, 3010  , 90010, '2019-12-12')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-12' where BB_id= 90010 and B_id=1002

insert into Donation values(6019, 1, 1003, 3116, 3003  , 90003, '2019-12-12')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-12' where BB_id= 90003 and B_id=1003

insert into Donation values(6020, 1, 1007, 3117, 3002  , 90002, '2019-12-12')
update Blood_inventory set BI_quantity=BI_quantity-1, BI_date='2019-12-12' where BB_id= 90002 and B_id=1007

select * from Donation
select sum(D_quantity) from Donation
select sum(bi_quantity) from Blood_inventory 


select * from Inventory_Manager
select * from Blood_inventory

select distinct * from History_Blood_inventory
select sum(BI_quantity) from Blood_inventory

select distinct * from History_Blood_inventory

select * from Blood_inventory
//* trigger on donor*//

create trigger tr_donor
on donor
after insert
as 
	insert into history_donor 
	select * from donor 

insert into history_donor select * from donor

select distinct * from history_donor

create trigger tr1_donor
on donor
after update
as 
	insert into history_donor 
	select * from donor  
select *from history_donor
	
//*Procedure*//
//* Procedure 1 *//

alter procedure topblood
as 
begin 
declare @count int
set @count = (select top 1 BI_quantity from Blood_inventory order by (BI_quantity)desc )
select b_id, bb_id, bi_quantity from Blood_inventory where BI_quantity=@count
end
go


execute topblood

select * from Blood_inventory

//*  Procedure 2 *//

create procedure topblood_Hospital
as 
begin 
select h_name from hospital where h_id=(select H_id from blood_bank where bb_id=(select top 1 BB_id from Blood_inventory order by (BI_quantity)desc ))
end
go

execute topblood_Hospital

//* Procedure 3 *//

alter procedure topbloodgroup_in_bloodbank

@bb_id int
as
begin
declare @count int
set @count= (select top 1 bi_quantity from Blood_inventory where BB_id=@bb_id order by (BI_quantity) desc)
select B_id, BB_id, BI_quantity from Blood_inventory where BB_id=@bb_id and BI_quantity=@count
end 
go

execute topbloodgroup_in_bloodbank 90006

select * from Blood_inventory where BB_id=90006
select b_id, bb_id, bi_quantity from Blood_inventory where BB_id=90006 order by (BI_quantity) desc

//* Procedure 4 *//

alter procedure Hospital_topbloodgroup
@bb_id int
as
begin
select h_name from hospital where h_id=(select h_id from Blood_Bank where bb_id=(select top 1 bb_id from Blood_inventory where BB_id=@bb_id order by (BI_quantity) desc))
end 
go

execute Hospital_topbloodgroup 90006

//* procedure 5 *//

Alter procedure lowbloodgroup
as 
begin
declare @count int
 
set @count= (select top 1 BI_quantity from Blood_inventory order by (BI_quantity)asc )
select b_id, bb_id, BI_quantity from Blood_inventory where BI_quantity=@count
end
go

execute lowbloodgroup

//* Procedure 6*//

create procedure Hospital_downbloodgroup
@bb_id int
as
begin
select h_name from hospital where h_id=(select h_id from Blood_Bank where bb_id=(select top 1 bb_id from Blood_inventory where BB_id=@bb_id order by (BI_quantity) asc))
end 
go

execute Hospital_downbloodgroup 90005

//* Procedur 7 *//

create procedure lowbloodgroup_bloodbank
@bb_id int
as
begin
declare @count int
set @count= (select top 1 BI_quantity from Blood_inventory where BB_id=@bb_id order by (BI_quantity)asc)
select B_id ,BB_id, BI_quantity  from Blood_inventory where BI_quantity=@count and BB_id=@bb_id
end 
go

execute lowbloodgroup_bloodbank 90002

//* procedure 10 *//

create procedure hospital_lowbloodgroup
@bb_id int
as
begin
select h_name from hospital where h_id=(select h_id from Blood_Bank where bb_id=(select top 1 bb_id from Blood_inventory where BB_id=@bb_id order by (BI_quantity) asc))
end 
go
execute hospital_lowbloodgroup 90002


//* Procedure 9 *//
//* Procedure for insertion *//

alter procedure add_donor
@id int,
@name varchar(30),
@age int,
@gender varchar(20),
@number varchar(20),
@date date,
@B_id int,
@BB_id int
as 
begin
if (@id =(Select D_id  from donor where d_id=@id))
	begin
	if(((select (day(getdate())*365)-(day(d_date)*365) from donor where d_id=@id))> 120)
	begin
	update donor set D_date=@date where D_id=@id
	update Blood_inventory set BI_quantity=BI_quantity+1,BI_date=@date where (B_id=@B_id) ANd (BB_id=@BB_id)

	end
	else
	begin
	print('You cannot donate blood')
	end
	end
else
begin
	insert into donor values(@id,@name,@age,@gender,@number,@date,@B_id, @BB_id)
	update Blood_inventory set BI_quantity=+1,BI_date=@date where (B_id=@B_id) ANd (BB_id=@BB_id)

end	
end

//* Procedure 10 *//
//* Procedure for Add donation *//

alter procedure add_donations

@date date,
@id int,
@bb_id int,
@quantity int,
@d_id int,
@r_id int,
@IM_id int,
@count date output
	
as 
begin
if(year(getdate())= (select top 1 year(D_date) from donor where b_id=@id and BB_id=@bb_id))
begin
	declare @total int 
	declare @avail int
    set @count =((getdate())-42)
	select @total=count(d_date) from donor where b_id=@id and BB_id=@bb_id and (d_date)< @count
	delete from History_Blood_inventory where BI_date< @count
	update Blood_inventory set BI_quantity= BI_quantity-@total where B_id=@id and BB_id=@bb_id
	if(@quantity< (select bi_quantity from Blood_inventory where B_id=@id and BB_id=@bb_id))
	begin
		update  Blood_inventory set BI_quantity= BI_quantity-@quantity where B_id=@id and BB_id=@bb_id
		insert into Donation values (@D_id, @quantity, @id, @r_id, @IM_id, @bb_id, @date)  
	end
	else
	begin
		set @avail= (select Bi_quantity from Blood_inventory where B_id=@id and BB_id=@bb_id)
		update  Blood_inventory set BI_quantity= BI_quantity-@avail where B_id=@id and BB_id=@bb_id
	end
end
end
go

declare @c date 
execute add_donations
print @c 

//* Procedure 11 *//

create procedure bloodtypetop
@b_id int
as 
begin
declare @count int
set @count=(select top 1 BI_quantity from Blood_inventory where B_id=@b_id order by (BI_quantity) desc)
select B_id,BB_id,BI_quantity from Blood_inventory where B_id=@b_id and BI_quantity=@count
end 
go 

execute bloodtypetop 1001

//* Procedure 12 *//

create procedure bloodtypedown
@b_id int
as 
begin
declare @count int
set @count=(select top 1 BI_quantity from Blood_inventory where B_id=@b_id order by (BI_quantity) asc)
select B_id,BB_id,BI_quantity from Blood_inventory where B_id=@b_id and BI_quantity=@count
end 
go 

execute bloodtypedown 1001

//* Procedure 13 *//

alter procedure bloodafter_dates
@date date
as 
begin
select  count(D_id) from donor where D_date>@date
end
go

execute bloodafter_dates '2019-12-05'

//* Procedure 14 *//

alter procedure mostdonating_blood
as
begin
select top 1 sum(D_quantity), B_id  from Donation group by B_id
end 
go

execute mostdonating_blood

select * from Donation

//* Procedure 15 *//

alter procedure mostrecieving_person
as begin 
select count(R_id), R_id from donation group by (R_id) 
end
go 

execute mostrecieving_person

//* Procedure 16 *//

create procedure mostrecievein_personname
as
begin


select R_name from reciever  where r_id =(select R_id from (select  top 1 count(R_id) as total , R_id from donation group by (R_id) order by (total)desc) ABC)
end

execute mostrecievein_personname

select * from Reciever

//* Procedure 17 *//

alter procedure mostdonation_bloodbank
as
begin
select top 1 sum(D_quantity) as total , BB_id from Donation group by BB_id order by (total) desc
end
go

execute mostdonation_bloodbank

//* Procedure 18 *//

create procedure hospital_name_mostdonating
as
begin

select h_name from hospital where h_id=(select h_id from blood_bank where bb_id = (select bb_id from (select top 1 sum(D_quantity) as total , BB_id from Donation group by BB_id order by (total) desc)AB))
end
go

execute hospital_name_mostdonating

select * from Hospital
select * from Blood_Bank

//* Procedure 19 *//

create procedure checking_expiry_date
@id int,
@bb_id int
as
begin
if(year(getdate())= (select top 1 year(D_date) from donor where b_id=@id and BB_id=@bb_id))
begin
	declare @count date
	declare @total int 
	declare @avail int
    set @count =((getdate())-42)
	select @total=count(d_date) from donor where b_id=@id and BB_id=@bb_id and (d_date)< @count
	delete from History_Blood_inventory where BI_date< @count
	update Blood_inventory set BI_quantity= BI_quantity-@total where B_id=@id and BB_id=@bb_id
end
end
go

execute checking_expiry_date

//* Procedure 20 *//


create view counting
as 
select distinct * from history_Donor


alter procedure most_donating_person
as
begin
select top 1 count(D_id)  as total from counting group by d_id order by (total)desc
end 
go


execute most_donating_person


update donor set D_date='2019-12-12' where D_id=162
update Blood_inventory set BI_quantity= BI_quantity+1, BI_date='2019-12-12' where B_id=1008 and BB_id=90006
select * from history_donor


select distinct * from History_Blood_inventory
select distinct * from history_donor
select distinct count(distinct D_id) as total from history_donor group by d_id order by (total)desc 
//* Proceure 21 *//

//* alter for donation *//


Create procedure add_donations1

@date date,
@id int,
@bb_id int,
@quantity int,
@d_id int,
@r_id int,
@IM_id int,
@count date output
	
as 
begin
if(year(getdate())= (select top 1 year(BI_date) from History_Blood_inventory where b_id=@id and BB_id=@bb_id))
begin
	declare @total int 
	declare @avail int
    set @count =((getdate())-42)
	while(( select bi_date from History_Blood_inventory where B_id=@id and BB_id=@bb_id ) != null)
	begin
	select @total=count(d_date) from donor where b_id=@id and BB_id=@bb_id and (d_date)< @count
	delete from History_Blood_inventory where BI_date< @count
	update Blood_inventory set BI_quantity= BI_quantity-@total where B_id=@id and BB_id=@bb_id
	if(@quantity< (select bi_quantity from Blood_inventory where B_id=@id and BB_id=@bb_id))
	begin
		update  Blood_inventory set BI_quantity= BI_quantity-@quantity where B_id=@id and BB_id=@bb_id
		insert into Donation values (@D_id, @quantity, @id, @r_id, @IM_id, @bb_id, @date)  
	end
	else
	begin
		set @avail= (select Bi_quantity from Blood_inventory where B_id=@id and BB_id=@bb_id)
		update  Blood_inventory set BI_quantity= BI_quantity-@avail where B_id=@id and BB_id=@bb_id
	end
	end
end
end
go