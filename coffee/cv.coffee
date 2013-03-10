$(document).ready ->
  CV.listenTag()
  $(".compAside").hide()
  #CV.hideAllSubTitle()
  #CV.listenSubTitle()


h4_article_selector = "article h4"
competences_selector = "article li"

@CV =

  listenTag : ->
    $(competences_selector).hover(
      -> CV.handlerIn(this),
      -> CV.handlerOut(this)
    )

  handlerIn : (elem) ->
    left = $(elem).position().left

    $("#" + $(elem).attr("id") + "Div").show()
    $("#" + $(elem).attr("id") + "Div").offset({ left: left - 70 })
    $(elem).addClass("check")
    $(".css-arrow-top").offset({ left: left + 20 })

  handlerOut : (elem) ->
    $("#" + $(elem).attr("id") + "Div").hide()
    $(elem).removeClass("check")

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