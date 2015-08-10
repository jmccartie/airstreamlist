#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require local_time

#= require jquery.ui.widget
#= require jquery.iframe-transport
#= require jquery.fileupload
#= require cloudinary/jquery.cloudinary
#= require attachinary

#= require_tree .

$ ->
  $('.attachinary-input').attachinary()