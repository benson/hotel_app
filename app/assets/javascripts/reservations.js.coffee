jQuery ->
  $('#reservation_start_date').datepicker({format: 'yyyy/mm/dd'})
  $('#reservation_end_date').datepicker({format: 'yyyy/mm/dd'})

# jQuery ->
#   $('#new-customer-button').click (event) -> 
#     event.preventDefault()
#     $('#new-customer-button').addClass("btn-active")
#     $('#existing-customer-button').removeClass("btn-active")
#     $('#new-customer-form').show("fast");
#     $('#existing-customer-form').hide("fast");
#     return false;

# jQuery ->
#   $('#existing-customer-button').click (event) -> 
#     event.preventDefault()
#     $('#existing-customer-button').addClass("btn-active")
#     $('#new-customer-button').removeClass("btn-active")
#     $('#new-customer-form').hide("fast");
#     $('#existing-customer-form').show("fast");
#     return false;
