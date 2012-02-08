class Stackr
  constructor: ->
    @stack = []
    @navHeaders = $ '.nav-header'
    @userStack = $ '#stack'
    
  highlightActive: (event) =>
    @navHeaders.removeClass 'active'
    $(event.currentTarget).addClass 'active'
    
  togglePackages: (event) =>
    el = $(event.currentTarget)
    if el.is ':checked'
      @stack.push el.val()
    else
      @stack = @stack.filter (package) -> package isnt el.val()
    @toggleStack()
    @renderStack()
    
  toggleStack: ->
    @userStack.collapse 'show' unless @userStack.hasClass 'in'
    @userStack.collapse 'hide' if @stack.length is 0
    
  renderStack: ->
    @userStack.find('ul').html Handlebars.templates.stack @stack

$ ->
  stackr = new Stackr()
  $('.sidebar-nav .nav-header').on 'click', stackr.highlightActive
  $('input[type="checkbox"]').on 'change', stackr.togglePackages