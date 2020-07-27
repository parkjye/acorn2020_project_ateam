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

//예약현황 Data
calendar.createSchedules([
    {
        id: '1',
        scheduleId: 'test',
        calendarId: 'Reservated', //삭제할 일정 ID
        title: '예약 됨',
        category: 'allday', //종류('milestone', 'task', allday', 'time')
        dueDateClass: '',
        start: '2020-07-26',
        end: '2020-07-27',
        isReadOnly: false, //읽기전용
    },
    {
        id: '2',
        calendarId: 'Reservation Available',
        title: '예약 가능',
        category: 'allday',
        dueDateClass: '',
        start: '2020-07-25',
        end: '2020-07-25',
        isReadOnly: true
    }
]);

//스케줄 CSS
calendar.setCalendarColor('Reservated', {
	  color: '#c1c1d7', //회색
	  bgColor: '#ffffff',
	  //dragBgColor: '#000000',
	  borderColor: '#0000ff' //blue
});

calendar.setCalendarColor('Reservation Available', {
	  color: '#000000', //회색
	  bgColor: '#ffffff',
	  //dragBgColor: '#000000',
	  borderColor: '#ff0000' //red
});

init();

