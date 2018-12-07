$(document).on("turbolinks:load", function() {
  const $pickerInput = $('.date_time_picker input.date_time_picker');
  const initialValue = $pickerInput.val();
  // the 2 steps above gets the value of the input field for date_time

  $('.date_time_picker > .input-group.date').datetimepicker({ format: 'YYYY-MM-DD HH:mm:ss' });
  // this ensures the value returned by the datetimepicker conforms to
  // ActiveRecord standard datetime format

  return $pickerInput.val(initialValue);
});