// 스크롤시 부드러운 움직임.
function scrollTo(element, dir) {
  if (dir == "up") {
    dir = element.offsetTop;
  } else {
    dir = element.offsetHeight;
  }
  window.scroll({
    behavior: "smooth",
    left: 0,
    top: dir,
  });
}

//윈도우 load 순서: html -> DOMContentLoaded -> css
function init() {
  window.addEventListener("DOMContentLoaded", () => {
    scrollTo(document.getElementsByTagName("body")[0], "up");
  });
}

//tui.calendar는 인터넷에서 다운받은 script. tui.Calendar 객체를 생성해서 사용한다.
var calendar = new tui.Calendar('#calendar', {
	  defaultView: 'month',
	  taskView: true,
	  //
	  //useCreationPopup: true,
	  useDetailPopup: true,
	  //
	  template: {
	    monthDayname: function(dayname) {
	      return '<span class="calendar-week-dayname-name">' + dayname.label + '</span>';
	    }
	  }
});

/*예약현황 Data
function createSchedules(){
		calendar.createSchedules([
		{
			id: '3',
			scheduleId: 'test-scheduleID',
			calendarId: 'Reservation Available', //삭제할 일정 ID
			title: '',
			category: 'allday',
			dueDateClass: '',
			start: '2020-07-15',
			end: '2020-07-15',
			isReadOnly: true, //읽기전용
		},
	]);
}
createSchedules();
createSchedules().title('예약');*/

//**
calendar.createSchedules([
    {
        id: '1',
        calendarId: 'Reservated', //삭제할 일정 ID
        title: '예약 됨',
        category: 'allday', //종류('milestone', 'task', allday', 'time')
        dueDateClass: '',
        start: '2020-07-26',
        end: '2020-07-26',
        isReadOnly: true, //읽기전용
    },
    {
        id: '2',
        calendarId: 'Reservation Available',
        title: '예약 가능',
        category: 'allday',
        dueDateClass: '',
        start: '2020-07-25',
        end: '2020-07-25',
        isReadOnly: false,
    }
]);

//예약완료-CSS
function reservatedAvailable(){
	calendar.setCalendarColor('Reservation Available', {
		  color: '#000000',
		  bgColor: '#ffffff',
		  //dragBgColor: '#000000',
		  borderColor: '#ff0000' //red
	});
}

//예약가능-CSS
function reservated(){
	calendar.setCalendarColor('Reservated', {
		  color: '#c1c1d7', //회색
		  bgColor: '#ffffff',
		  //dragBgColor: '#000000',
		  borderColor: '#0000ff' //blue
	});
}

reservatedAvailable();
reservated();

//일정 수정
function deleteSchedule(){
	calendar.on('beforeUpdateSchedule', scheduleData => {
	  const {schedule} = scheduleData;

	  calendar.updateSchedule(schedule.id, schedule.calendarId, schedule);
	});
}

//일정 삭제
function modifyShedule(){
	calendar.on('beforeDeleteSchedule', scheduleData => {
		  const {schedule, start, end} = scheduleData;

		  schedule.start = start;
		  schedule.end = end;
		  calendar.deleteSchedule(schedule.id, schedule.calendarId);
	});
}


init();

