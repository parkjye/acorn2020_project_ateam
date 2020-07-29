SELECT * from (select result1.*, rownum as rnum 
from (select board_num, users_id, board_title from tb_board order by board_num desc) result1) 
where rnum between 1 and 20;



select *
from (select result1.*, ROWNUM as rnum
		from(select board_num, users_id, board_title, board_view, board_comment_count, 
					board_up, board_down, board_date)
		from tb_board order by board_num desc) result1 )
where rnum between ? and ?


select * from (select result.*, rownum as rnum 
				from (select board_num, users_id, board_title, board_content, 
						board_view, board_comment_count, board_up, board_down, board_date)
						from board_file
						where board_title like '%'|| ? ||'%' oreder by board_num desc) result1)
						where rnum between ? and ?";