# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $("[id^=newDailyProgress-]")
    .on 'ajax:success', (e, data, status, xhr) ->
      $('#newProgress #daily_progress_goal').val(data.goal)
      $('#newProgress #daily_progress_practice_id').val(data.practice_id)
    .on 'ajax:error', (e, xhr, status, err) ->
      console.log status
  $("#new_daily_progress")
    .on 'ajax:success', (e, data, status, xhr) ->
      console.log('hoge')
      $("[id^=newDailyProgress-#{data.practice_id}]").hide()
      $('#newProgress #daily_progress_goal').val(0)
      $('#newProgress #daily_progress_practice_id').val('')
    .on 'ajax:error', (e, xhr, status, err) ->
      console.log status

