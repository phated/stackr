$ ->
  stack = []

  $('.sidebar-nav .collapse').on 'show', ->
    $('.nav-header').removeClass 'active'
    id = $(this).attr 'id'
    $("[data-target=\"\##{id}\"]").parent('.nav-header').addClass('active');

  $('input[type="checkbox"]').on 'change', ->
    if $(@).is ':checked'
      stack.push @value
    else
      stack = stack.filter (package) => package isnt @value
    unless $('#stack').hasClass 'in'
      $('#stack').collapse 'show'
    $('#stack').collapse 'hide' if stack.length is 0
    console.log stack
