// This initializes all elements that have data-behaviour=datepicker as a datepicker.    
// There is no need to repeat this statement anywhere else. 
$(document).ready(function(){
  $('[data-behaviour~=datepicker]').datepicker({
    format: 'dd/mm/yyyy'});
})
