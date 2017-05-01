// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require trix
//= require bootstrap/modal
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload
//= require_tree .





/* global filepicker: false */

(function() {
  'use strict';

  var file_path = '/users/4765/';

  function add(attachment) {
    if (attachment.file) {
      $("#fileToUpload").prop('disabled', true);
      $(".assignment-btn").prop('disabled', true);
      var extension = attachment.file.name.split('.').pop();
      $("#flash_message_span").html("图片上传中，请耐心等待");

      var timeout_triggered = false;
      var time_id;

      if (!timeout_triggered) {
        timeout_triggered = true;
        time_id = setTimeout(function(){
          $("#flash_message_span").html("如果上传进度条很长时间都没有变动，可能是网络状况欠佳<br/>您可以继续耐心等待一段时间，或者刷新页面、换一个网络重新提交");
        }, 30000);
      }

      filepicker.store(
        attachment.file,
        { path :  file_path },
        function(blob) {
          $(".assignment-btn").val("处理中...");
          attachment.setAttributes({
            href: blob.url,
            url: blob.url
          });

          var interval = setInterval(function(){
            if (!$('.answer-form').find("[id^=answer_body_trix_input_answer]").val().includes("blob:")) {
              $(".assignment-btn").prop('disabled', false);
              $(".assignment-btn").val("提交");
              $("#fileToUpload").prop('disabled', false);

              clearTimeout(time_id);
              $("#flash_message_span").html("");
              clearInterval(interval);
            }
          }, 500)
        },
        function() {
          // Error callback
        },
        function(progress) {
          if (progress > 95) {
            $(".assignment-btn").val("处理中...");
          }
          $(".assignment-btn").val(progress + "\%");
          attachment.setUploadProgress(progress);
        }
      );
    }
  }

  function remove(attachment) {
    filepicker.remove({
      url: attachment.getURL()
    });
  }

  function delete_remote_btn_in_trix_hidden_input() {
    var origin_value = $('.answer-form').find("[id^=answer_body_trix_input_answer]").val();
    var updated_value = origin_value.replace("<button type=\"button\" title=\"Remove\" class=\"remove icon\">Remove</button>", "");
    $('.answer-form').find("[id^=answer_body_trix_input_answer]").val(updated_value);
  }

  $(document).ready(function(){
    $('.assignment-btn').on('click', function(e){
      delete_remote_btn_in_trix_hidden_input();
      return true;
    });
  });


  $(function() {
    $(document).on('trix-attachment-add', function(event) {
      add(event.originalEvent.attachment);
    });

    $(document).on('trix-attachment-remove', function(event) {
      remove(event.originalEvent.attachment);
    });


    $("#fileToUpload").change(function() {
      if ($("#fileToUpload")[0].files[0]) {
        var file = $("#fileToUpload")[0].files[0];
        $("trix-editor")[0].editor.insertFile(file);
      }
    });

    var fpApiKey = $('meta[name=fp-apikey]').attr('content');
    filepicker.setKey(fpApiKey);

  });
}());
