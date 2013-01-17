# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $( "#request_start_date" ).datepicker
    showOn: "both",
    buttonImage: "calendar.gif",
    buttonImageOnly: true,
    dateFormat: 'yy-mm-dd',
    changeMonth: true,
    changeYear: true
  $( "#request_end_date" ).datepicker
    showOn: "both",
    buttonImage: "calendar.gif",
    buttonImageOnly: true, 
    dateFormat: 'yy-mm-dd',
    changeMonth: true,
    changeYear: true