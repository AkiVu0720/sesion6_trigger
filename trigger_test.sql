Create Database Trigger_Demo;
use Trigger_Demo;
create table Product(
productId varchar(4) primary key not null,
productName varchar(30) not null,
price float default 0
);
-- tạo trigger insert

Delimiter //
Create trigger before_insert before insert on Product for each row
begin
If new.price<0 then
signal sqlstate '02000' set message_text = ' Giá nhập không hợp lệ';
end if;
End //
Delimiter ;
drop trigger before_insert;
Insert into Product value('sp1', 'Hoa quả', 110);
Select * from Product

-- tạo trigger update
Delimiter //
Create trigger before_update before update on Product for each row
begin
If new.price<0 then
set new.price = 0;
end if;
End //
Delimiter ;
Update Product set price = -4 where productId = 'sp1';