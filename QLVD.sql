use master 
go 
create database [QLVD]
go
use QLVD
go

create table [user]
(
id             int             primary key identity,
username        varchar(10)     unique not null,
[password]     varchar(10)     not null,
email          varchar(50)	   unique not null,
isAdmin		   bit			   not null default 0,
isActive       bit			   not null default 1
)
go

create table video
(
id			  int			 primary key identity,
title		 nvarchar(255)   not null,
href		 varchar(50)	 unique not null,
poster	     varchar(255)    null,
[views]      int			 not null default 0,
shares		 int			 not null default 0,
[description] nvarchar(255)  not null,
isActive      bit			 not null default 1
)
go

create table history
(
id			 int			 primary key identity,
userId		 int			 foreign key references [user](id),
videoId		 int			 foreign  key references [video] (id),
viewedDate   datetime		 not null default getDate(),
isLiked		 bit			 not null default 0,
likeDate	 datetime		 null
)
go


insert into [user](username, [password], email, isAdmin) values
('namnv',	  '111', 'namquyen221020@gmail.com',   1),
('namnguyen', '123', 'namnvps26942@fpt.edu.vn',   0)
go

insert into video(title, href, [description]) values
(N'Cưới Thôi 2 - Masew x Masiu', 'jh5JehBfnWw',  N'Masew x Masiu'),
(N'KARIK - BẠN ĐỜI (FT. GDUCKY) ',  'h7cOOfpdEfk',  N'KARIK - FT. GDUCKY'),
(N'Người Con Gái Ta Thương - Thỏ Xỏ Khuyên', '0GBrCZHQnAA',  N'Thỏ Xỏ Khuyên')
go

insert into history(userId, videoId, isLiked, likeDate) values
(2, 1, 1, getDate() ),
(2, 3, 0, null)
go



