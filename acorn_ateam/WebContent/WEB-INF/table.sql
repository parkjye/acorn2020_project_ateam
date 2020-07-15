--게시판 table 생성
create table tb_board(
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

create sequence tb_board_seq;