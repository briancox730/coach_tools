$(document).ready(function() {
  $('.pr-row').on('click', function() {
    $('.added-row').remove();
    var value = $(this).find('.value').html();
    var movement = $(this).find('td:first').html();
    var values = [.5, .55, .6, .65, .7, .75, .8, .85, .9, .95];
    for (i=0; i<values.length; i++) {
      $(this).after('<tr class=\"added-row\"><td><strong>'+
        movement+'</strong> - '+values[i]+'%</td><td><strong>'+
        (value * values[i]).toFixed(2)+'</strong></td></tr>')
    };
  });
});
