#Consider the relations: PART, SUPPLIER and SUPPLY. The Supplier relation holds information
#about suppliers. The attributes SID, SNAME, SADDR describes the supplier. The Part relation holds
#the attributes such as PID, PNAME and PCOLOR. The Shipment relation holds information about
#shipments that include SID and PID attributes identifying the supplier of the shipment and the part
#shipped, respectively. The Shipment relation should contain information on the number of parts
#shipped

Create table supplier(sid varchar2(20) not null primary key,  sname char(20),  saddr varchar2(20));  
Create table part(pid varchar2(20) not null primary key,  pname char(20),  pcolor varchar2(20));  
Create table shipment(sid varchar2(20) references supplier(sid),  pid varchar2(20)) references part(pid);  
