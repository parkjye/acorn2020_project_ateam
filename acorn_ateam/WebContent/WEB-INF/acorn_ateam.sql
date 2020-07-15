--[tb_users 테이블관련]
--0.초기화
drop table tb_users;
drop sequence users_num_seq;
DROP TRIGGER TB_USERS_TRIG;
commit;
--1.테이블 생성
CREATE TABLE tb_users
(
    users_num number not null UNIQUE,
    users_id varchar2(255) not null primary key,
    users_pwd varchar2(255) not null,
    users_phone varchar2(255),
    users_email varchar2(255)
);
--2.시퀀스 생성
CREATE SEQUENCE users_num_seq;
--3.트리거 생성 
CREATE OR REPLACE TRIGGER "TB_USERS_TRIG" 
   before insert on "TB_USERS" 
   for each row 
begin  
   if inserting then 
      if :NEW."USERS_NUM" is null then 
         select USERS_NUM_SEQ.nextval into :NEW."USERS_NUM" from dual; 
      end if; 
   end if; 
end;

ALTER TRIGGER "TB_USERS_TRIG" ENABLE

--[tb_comment 테이블관련]
--0.초기화
drop table tb_comment;
drop sequence comment_num_seq;
DROP TRIGGER tb_comment_TRIG;
--1.테이블 생성
CREATE TABLE tb_comment
(
    comment_num number not null primary key,
    comment_content varchar2(600),
    comment_date date  not null,
    users_id varchar2(255),
    board_num number
);
--2.시퀀스 생성
create sequence comment_num_seq;
--3 트리거 생성
CREATE OR REPLACE TRIGGER "tb_comment_TRIG" 
   before insert on "tb_comment" 
   for each row 
begin  
   if inserting then 
      if :NEW."comment_num" is null then 
         select comment_num_seq.nextval into :NEW."comment_num" from dual; 
      end if; 
   end if; 
end;

ALTER TRIGGER "tb_comment_TRIG" ENABLE

--[tb_board 테이블관련]
--0.초기화
drop table tb_board;
drop sequence board_num_seq;
DROP TRIGGER tb_board_TRIG;
--1.테이블 생성
CREATE TABLE tb_board
(
    board_num number not null primary key,
    users_id varchar2(255)  not null,
    board_title varchar2(255)  not null,
    board_content varchar2(4000),
    board_view number  not null,
    board_comment_count number  not null,
    board_up number  not null,
    board_down number  not null,
    board_date date  not null
);
--2.시퀀스 생성
create sequence board_num_seq;
--3 트리거 생성
CREATE OR REPLACE TRIGGER "tb_board_TRIG" 
   before insert on "board_num" 
   for each row 
begin  
   if inserting then 
      if :NEW."board_num" is null then 
         select board_num_seq.nextval into :NEW."board_num" from dual; 
      end if; 
   end if; 
end;

ALTER TRIGGER "tb_board_TRIG" ENABLE

--[tb_room 테이블 관련]
--0.초기화
drop table tb_room;
--1.테이블 생성
CREATE TABLE tb_room
(
    room_name varchar2(255) not null primary key
);


--[tb_date 테이블 관련]
--0.초기화
drop table tb_date;
drop sequence date_num_seq;
DROP TRIGGER tb_date_TRIG;
--1.테이블 생성
CREATE TABLE tb_date
(
    date_num number not null,
    date_year varchar2(255) not null,
    date_month varchar2(255) not null,
    date_day varchar2(255) not null,
    date_isUsing number not null,
    date_sale number not null,
    date_holiday number not null,
    room_name varchar2(255) not null,
    CONSTRAINT tb_date_pk PRIMARY KEY (date_num, date_year,date_month,date_day)
);
--2.시퀀스 생성
create sequence date_num_seq;
--3 트리거 생성
CREATE OR REPLACE TRIGGER "tb_date_TRIG" 
   before insert on "date_num" 
   for each row 
begin  
   if inserting then 
      if :NEW."date_num" is null then 
         select date_num_seq.nextval into :NEW."date_num" from dual; 
      end if; 
   end if; 
end;

ALTER TRIGGER "tb_date_TRIG" ENABLE

--[tb_reserve 테이블 관련
--0.초기화
drop table tb_reserve;
drop sequence reserve_num_seq;
DROP TRIGGER tb_reserve_TRIG;
alter table tb_reserve drop constraint tb_reserve_fk;
--1.테이블 생성
CREATE TABLE tb_reserve
(
    reserve_num number not null,
    date_num number not null,
    date_year varchar2(255) not null,
    date_month varchar2(255) not null,
    date_day varchar2(255) not null,
    users_id varchar2(255) not null,
    room_name varchar2(255) not null,
    constraint tb_reserve_fk foreign key(date_num, date_year,date_month,date_day)
    references tb_date(date_num, date_year,date_month,date_day)
);
--2.시퀀스 생성
create sequence reserve_num_seq;
--3 트리거 생성
CREATE OR REPLACE TRIGGER "tb_reserve_TRIG" 
   before insert on "tb_reserve" 
   for each row 
begin  
   if inserting then 
      if :NEW."tb_reserve" is null then 
         select reserve_num_seq.nextval into :NEW."tb_reserve" from dual; 
      end if; 
   end if; 
end;

ALTER TRIGGER "tb_reserve_TRIG" ENABLE
