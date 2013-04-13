$(document).ready ->
  CV.listenMenu()
  CV.showSkills()
  #CV.listenTag()
  #$(".compAside").hide()
  #CV.hideAllSubTitle()
  #CV.listenSubTitle()


#h4_article_selector = "article h4"
#competences_selector = "article li"

@CV =

  listenMenu : ->
    $("#main-menu li a").on "click", ->
      CV.activePage(this, $(this).parent("li"))

  activePage : (elemFromEvent, parentElem) ->
    pageToActive = CV.retrievePageToActive(elemFromEvent)

    CV.hideOldActivePage()
    CV.unactiveOldMenu()
    CV.activeNewMenu(parentElem)
    CV.showNewActivePage(pageToActive)

  retrievePageToActive : (elemFromEvent) ->
    hrefLinkValue = $(elemFromEvent).attr("href").substring(1)
    pageToActiveId = "#page-" + hrefLinkValue
    pageToActiveId

  hideOldActivePage : ->
    $(".content-pages div.on").addClass("off")
    $(".content-pages div.on").removeClass("on")

  unactiveOldMenu : ->
    $("#main-menu li.active").removeClass("active")

  activeNewMenu : (menuToActive) ->
    $(menuToActive).addClass("active")

  showNewActivePage : (pageToActive) ->
    $(pageToActive).removeClass("off")
    $(pageToActive).addClass("on")



  showSkills : ->
    $("div.skill div.level i").each (i) ->
      CV.showLevel this

  showLevel : (elem) ->
    level = elem.className.split(/\s+/)[1]
    if(level == undefined)
      level = "noob"

    width = '25%'
    label = "<span style='padding-left: 20%;'>débutant</span>"

    if(level.contains("mid"))
      width = '50%'
      label = "<span style='padding-left: 45%;'>intermédiaire</span>"
    else if(level.contains("exp"))
      width = '75%'
      label = "<span style='padding-left: 70%;'>experimenté</span>"
    else if(level.contains("sup"))
      width = '100%'
      label = "<span style='padding-left: 95%;'>expert</span>"

    $(elem).css({'width': width})
    $(elem).html(label)

  ###listenTag : ->
    $(competences_selector).hover(
      -> CV.handlerIn(this),
      -> CV.handlerOut(this)
    )###

  handlerIn : (elem) ->
    left = $(elem).position().left

    $("#" + $(elem).attr("id") + "Div").show()
    $("#" + $(elem).attr("id") + "Div").offset({ left: left - 20 })
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

