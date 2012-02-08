(function() {
  var Stackr,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Stackr = (function() {

    function Stackr() {
      this.togglePackages = __bind(this.togglePackages, this);
      this.highlightActive = __bind(this.highlightActive, this);      this.stack = [];
      this.navHeaders = $('.nav-header');
      this.userStack = $('#stack');
    }

    Stackr.prototype.highlightActive = function(event) {
      this.navHeaders.removeClass('active');
      return $(event.currentTarget).addClass('active');
    };

    Stackr.prototype.togglePackages = function(event) {
      var el;
      el = $(event.currentTarget);
      if (el.is(':checked')) {
        this.stack.push(el.val());
      } else {
        this.stack = this.stack.filter(function(package) {
          return package !== el.val();
        });
      }
      this.toggleStack();
      return this.renderStack();
    };

    Stackr.prototype.toggleStack = function() {
      if (!this.userStack.hasClass('in')) this.userStack.collapse('show');
      if (this.stack.length === 0) return this.userStack.collapse('hide');
    };

    Stackr.prototype.renderStack = function() {
      return this.userStack.find('ul').html(Handlebars.templates.stack(this.stack));
    };

    return Stackr;

  })();

  $(function() {
    var stackr;
    stackr = new Stackr();
    $('.sidebar-nav .nav-header').on('click', stackr.highlightActive);
    return $('input[type="checkbox"]').on('change', stackr.togglePackages);
  });

}).call(this);
