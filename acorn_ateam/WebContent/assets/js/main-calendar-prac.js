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

/***************************************************************/

//tui.calendar는 인터넷에서 다운받은 script. tui.Calendar 객체를 생성해서 사용한다.
var calendar = new tui.Calendar('#calendar', {
	  defaultView: 'month',
	  taskView: true,
	  //
	  template: templates,
	  useCreationPopup: true,
	  useDetailPopup: true,
	  //
	  template: {
	    monthDayname: function(dayname) {
	      return '<span class="calendar-week-dayname-name">' + dayname.label + '</span>';
	    }
	  }
});


//**
calendar.createSchedules([
    {
        id: '1',
        calendarId: 'Reservated', //삭제할 일정 ID
        title: '예약 됨',
        category: 'allday', //종류('milestone', 'task', 'allday', 'time')
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

/***************************************************************/
/***************************************************************/

//POPU

// register templates
var templates = {
  /*popupIsAllDay: function() {
    return 'All Day';
  },
  popupStateFree: function() {
    return 'Free';
  },
  popupStateBusy: function() {
    return 'Busy';
  },*/
  titlePlaceholder: function() {
    //return 'Subject';
    return 'Subject';
  },
  locationPlaceholder: function() {
    return 'Location';
  },
  startDatePlaceholder: function() {
    return 'Start date';
  },
  endDatePlaceholder: function() {
    return 'End date';
  },
  popupSave: function() {
    return 'Save';
  },
  popupUpdate: function() {
    return 'Update';
  },
  popupDetailDate: function(isAllDay, start, end) {
    var isSameDate = moment(start).isSame(end);
    var endFormat = (isSameDate ? '' : 'YYYY.MM.DD ') + 'hh:mm a';

    if (isAllDay) {
      return moment(start).format('YYYY.MM.DD') + (isSameDate ? '' : ' - ' + moment(end).format('YYYY.MM.DD'));
    }

    return (moment(start).format('YYYY.MM.DD hh:mm a') + ' - ' + moment(end).format(endFormat));
  },
  popupDetailLocation: function(schedule) {
    return 'Location : ' + schedule.location;
  },
  popupDetailUser: function(schedule) {
    return 'User : ' + (schedule.attendees || []).join(', ');
  },
  popupDetailState: function(schedule) {
    return 'State : ' + schedule.state || 'Busy';
  },
  popupDetailRepeat: function(schedule) {
    return 'Repeat : ' + schedule.recurrenceRule;
  },
  popupDetailBody: function(schedule) {
    return 'Body : ' + schedule.body;
  },
  popupEdit: function() {
    return 'Edit';
  },
  popupDelete: function() {
    return 'Delete';
  }
};


/***************************************************************/
init();

