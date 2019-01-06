document.addEventListener("turbolinks:load", function() {
  $('.timepicker').timepicker({
    timeFormat: 'h:mm p',
    interval: 30,
    minTime: '06',
    maxTime: '6:00pm',
    defaultTime: '8',
    startTime: '06:00',
    dynamic: false,
    dropdown: true,
    scrollbar: true,
    template: 'modal'
  });
});