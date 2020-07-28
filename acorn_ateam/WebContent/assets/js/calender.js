var calendar = new tui.Calendar("#calendar", {
  defaultView: "month",
  taskView: true,
  template: {
    monthDayname: function (dayname) {
      return '<span class="calendar-week-dayname-name">' + dayname.label + "</span>";
    },
  },
});
calendar.on("clickMore", function (event) {
  console.log("clickMore", event.date, event.target);
});
// calendar.on("clickSchedule", function (event) {
//   var schedule = event.schedule;

//   if (lastClickSchedule) {
//     calendar.updateSchedule(lastClickSchedule.id, lastClickSchedule.calendarId, {
//       isFocused: false,
//     });
//   }
//   calendar.updateSchedule(schedule.id, schedule.calendarId, {
//     isFocused: true,
//   });

//   lastClickSchedule = schedule;
//   // open detail view
// });
calendar.toggleScheduleView(false);
calendar.toggleTaskView(false);
// calendar.setOptions(disableClick, true);
// calendar.setOptions(isReadOnly, true);

calendar.createSchedules([
  {
    id: "1",
    calendarId: "1",
    title: "my schedule",
    category: "time",
    dueDateClass: "",
    start: "2020-07-24T22:30:00+09:00",
    end: "2020-07-24T02:30:00+09:00",
  },
]);
