# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require materialize-sprockets
#= require turbolinks
#= require_tree .

ready = ->
  console.log 'Document loaded'
  $(".button-collapse").sideNav()
  $('#collapsible-areas').collapsible({
    accordion : false
  })

  $('#collapsible-patents').collapsible({
    accordion : false
  })

  $('.modal-trigger').leanModal()

  $(document).on 'click', '.selectable-item', ->
    $(this).addClass('item-selected')
    $(this).siblings().removeClass('item-selected')

    url = 'patents/' + $(this).data('id') + '/select'
    request = { id: $(this).data('id') }
    
    $.post url, request
    null
  $(document).on 'click', '.icon.align-right', ->
    $icon = $(this).children('i')
    $icon.toggleClass 'fa-star-o'
    $icon.toggleClass 'fa-star'
    null
  null
$(document).ready(ready)
$(document).on('page:load', ready)