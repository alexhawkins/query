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