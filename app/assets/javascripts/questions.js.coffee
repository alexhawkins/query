# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#X-EDITABLE ENTRIES - EDIT ELEMENTS IN PAGE
$ ->
  $("[data-xeditable=true]").each ->
    $(@).editable
      ajaxOptions:
        type: "PUT"
        dataType: "json"
      params: (params) ->
        railsParams = {}
        railsParams[$(@).data("model")] = {}
        railsParams[$(@).data("model")][params.name] = params.value

        return railsParams

#INFINITE SCROLL
jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_answers_url = $('.pagination .next_page a').attr('href')
      if more_answers_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
          $('.pagination').html("<img src='/assets/ajax-loader.gif' alt='Loading...' title='Loading...' class='img-responsive' />")
          $.getScript more_answers_url
      return
  return
