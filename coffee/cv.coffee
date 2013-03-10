$(document).ready ->
  #CV.hideAllSubTitle()
  #CV.listenSubTitle()


h4_article_selector = "article h4"

@CV =

  hideAllSubTitle : ->
    $("article h4 + ul").hide()

  listenSubTitle : ->
    $(h4_article_selector).on "click", ->
      visible = $(this).next("ul").css("display")
      if(visible == "none")
        CV.showSubTitle(this)
      else
        CV.hideSubTitle(this)

  showSubTitle : (h4this) ->
    $(h4this).next("ul").show()

  hideSubTitle : (h4this) ->
    $(h4this).next("ul").hide()