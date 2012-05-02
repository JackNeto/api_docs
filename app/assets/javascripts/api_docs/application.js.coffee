#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require_tree .

$ ->
  # Select the first panel and the first sub-panel
  $('ul.main-tabs a:last').tab('show')
  $('ul.sub-tabs').each ->
    $(this).find('a:first').tab('show')
    
  # Switch to the panel selected by the URL
  panel_id = window.location.hash.substring(1)
  if window.location.hash? and window.location.hash != ''
    $('ul.main-tabs a[href="#' + panel_id + '"]').tab('show')    
    
  # --- Clicking on a tab ---
  $('ul.main-tabs li a').click (event) -> 
    window.location.hash = $(this).attr('href')
    
  # --- Submitting the form ---
  $('.panel form').live 'submit', (event) ->
    action = $(this).attr('action')
    ids = action.match(/\/(:\w*)/g)
    for id in ids
      input_field = $(this).find('input[name='+id.substring(2)+']')
      $(this).attr('action', action.replace(id, '/' + input_field.attr('value')))
