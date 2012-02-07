(function() {

  $(function() {
    var stack;
    stack = [];
    $('.sidebar-nav .collapse').on('show', function() {
      var id;
      $('.nav-header').removeClass('active');
      id = $(this).attr('id');
      return $("[data-target=\"\#" + id + "\"]").parent('.nav-header').addClass('active');
    });
    return $('input[type="checkbox"]').on('change', function() {
      var _this = this;
      if ($(this).is(':checked')) {
        stack.push(this.value);
      } else {
        stack = stack.filter(function(package) {
          return package !== _this.value;
        });
      }
      if (!$('#stack').hasClass('in')) $('#stack').collapse('show');
      if (stack.length === 0) $('#stack').collapse('hide');
      return console.log(stack);
    });
  });

}).call(this);
