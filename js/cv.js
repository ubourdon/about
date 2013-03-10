(function() {
  var competences_selector, h4_article_selector;

  $(document).ready(function() {
    CV.listenTag();
    return $(".compAside").hide();
  });

  h4_article_selector = "article h4";

  competences_selector = "article li";

  this.CV = {
    listenTag: function() {
      return $(competences_selector).hover(function() {
        return CV.handlerIn(this);
      }, function() {
        return CV.handlerOut(this);
      });
    },
    handlerIn: function(elem) {
      var left;
      left = $(elem).position().left;
      $("#" + $(elem).attr("id") + "Div").show();
      $("#" + $(elem).attr("id") + "Div").offset({
        left: left - 70
      });
      $(elem).addClass("check");
      return $(".css-arrow-top").offset({
        left: left + 20
      });
    },
    handlerOut: function(elem) {
      $("#" + $(elem).attr("id") + "Div").hide();
      return $(elem).removeClass("check");
    },
    hideAllSubTitle: function() {
      return $("article h4 + ul").hide();
    },
    listenSubTitle: function() {
      return $(h4_article_selector).on("click", function() {
        var visible;
        visible = $(this).next("ul").css("display");
        if (visible === "none") {
          return CV.showSubTitle(this);
        } else {
          return CV.hideSubTitle(this);
        }
      });
    },
    showSubTitle: function(h4this) {
      return $(h4this).next("ul").show();
    },
    hideSubTitle: function(h4this) {
      return $(h4this).next("ul").hide();
    }
  };

}).call(this);
