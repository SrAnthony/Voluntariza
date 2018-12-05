$(document).on 'turbolinks:load', ->
  $('.air-datepicker').datepicker({language: 'pt-BR'})
  $('.air-datepicker-time').datepicker({language: 'pt-BR', timepicker: true})
