---
---

fallback.load {
  waves_css: 'css/waves.css'
  'WavesJS': [ '/js/waves.js' ]
  'VelocityJS': [ '/js/velocity.min.js' ]
  'jQuery': [ 'https://code.jquery.com/jquery-1.11.3.min.js' ]
  'scrollToJS': [ '/js/jquery.scrollTo.min.js' ]
  'BootstrapJS': [ '/js/bootstrap.min.js' ]
}, 
  shim: 
    'BootstrapJS': [ 'jQuery' ]
    'scrollToJS': [ 'jQuery' ]
    'VelocityJS': [ 'jQuery' ]

fallback.ready [
  'jQuery'
], ->
  $(document).ready ->
    Waves.init()

fallback.ready ->
  ready = ->
    $('.open-main-nav').each ->
      that = $(this)
      nav_id = that.data('activates')
      nav_element = $('#' + nav_id)

      that.on 'click', (e) ->
        e.preventDefault()
        nav_element.css({left: 0})
        if $('#nav-overlay').length == 0
          overlay = $('<div id="nav-overlay"></div>')
          overlay.css('opacity', 0).click ->
            $(this).velocity { opacity: 0 },
              duration: 600
              queue: false
              easing: 'easeInOutCubic'
              complete: ->
                $(this).remove()
            nav_element.removeAttr('style')
          $('body').append(overlay)
          overlay.velocity { opacity: 1 },
            duration: 600
            queue: false
            easing: 'easeInOutCubic'

      $('#main-menu-nav').each ->
        that = $(this)

        that.find("ul.side-nav a").on 'click', (e) ->
          _ = $(this).attr('href')
          switch _
            when "#me", "#technical", "#service", "#contact-me"
              e.preventDefault()
              $.scrollTo $(_), 700, easing: 'swing'

  scroll = ->
    title = $('.open-nav-container > h1')
    container = $('.open-nav-container')
    if $(document).scrollTop() >= 624 && $(document).width() <= 767
      title.addClass 'active'
      container.addClass 'full-width'
      title.removeClass 'hidden'
    else
      if $(document).scrollTop() >= 452 && $(document).width() <= 767
        container.addClass 'full-width'
        title.removeClass 'hidden'
      else
        container.removeClass 'full-width'
        title.addClass 'hidden'
      title.removeClass 'active'

  js_on_resize_and_load = ->
    main_box = $('.main-box')

    if parseInt $(this).width() < 767
      main_box.removeClass('s-1')
    else
      main_box.addClass('s-1')

  $(document).ready ready
  $(document).on 'scroll', scroll
  $(document).on 'resize', scroll
  $(window).load js_on_resize_and_load
  $(window).resize js_on_resize_and_load
