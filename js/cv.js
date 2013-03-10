(function() {
  var h4_article_selector;

  $(document).ready(function() {});

  h4_article_selector = "article h4";

  this.CV = {
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
