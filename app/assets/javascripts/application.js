// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap
//= require_tree .
jQuery(document).ready(function(){

$('#bkdetail_actualValue').on('blur',function(){
	var actual = $(this).val();
	var target = $('#bkdetail_targetValue').val();
	var kpi_id = $('#bkdetail_kpi_id').val();
	$.get('/get_target_percentage?' + 'actual_value=' + actual + '&target_value=' + target + '&kpi_id=' + kpi_id ,
	   function(result) {
	   		$('#bkdetail_targetPercentage').val(result);
	   });
});

$(".date_picker_input").datepicker({ dateFormat: 'dd-mm-yy'});
	$(".month_picker_input").datepicker({ 
	       dateFormat: 'mm-yy',
	       changeMonth: true,
	       changeYear: true,
	       showButtonPanel: true,
	
	       onClose: function(dateText, inst) {  
	           var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val(); 
	           var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val(); 
	           $(this).val($.datepicker.formatDate('yy-mm', new Date(year, month, 1)));
	       }
	   });
	
	   $(".month_picker_input").focus(function () {
	       $(".ui-datepicker-calendar").hide();
	       $("#ui-datepicker-div").position({
	           my: "center top",
	           at: "center bottom",
	           of: $(this)
	       });    
	   });

	$(".quarter_picker_input").datepicker({ stepMonths: 3 ,
	       dateFormat: 'mm-yy',
	       changeMonth: true,
	       changeYear: true,
	       showButtonPanel: true,

	
	       onClose: function(dateText, inst) {  
	           var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val(); 
	           var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val(); 
	           $(this).val($.datepicker.formatDate('yy-mm', new Date(year, month, 1)));
	       }
	   });
	
	   $(".quarter_picker_input").focus(function () {
	       $(".ui-datepicker-calendar").hide();
	       $("#ui-datepicker-div").position({
	           my: "center top",
	           at: "center bottom",
	           of: $(this)
	       });    
	   });
	   
	$(".halfyear_picker_input").datepicker({ stepMonths: 6 ,
	       dateFormat: 'mm-yy',
	       changeMonth: true,
	       changeYear: true,
	       showButtonPanel: true,

	
	       onClose: function(dateText, inst) {  
	           var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val(); 
	           var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val(); 
	           $(this).val($.datepicker.formatDate('yy-mm', new Date(year, month, 1)));
	       }
	   });
	
	   $(".halfyear_picker_input").focus(function () {
	       $(".ui-datepicker-calendar").hide();
	       $("#ui-datepicker-div").position({
	           my: "center top",
	           at: "center bottom",
	           of: $(this)
	       });    
	   });
   
	$(".year_picker_input").datepicker({ 
	       dateFormat: 'yy',	       
	       changeYear: true,
	       showButtonPanel: true,
	
	       onClose: function(dateText, inst) { 
	           
	           var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val(); 
	           $(this).val($.datepicker.formatDate('yy', new Date(year, 1, 1)));
	       }
	   })	
	   $(".year_picker_input").focus(function () {
	       $(".ui-datepicker-calendar").hide();
	       $(".ui-datepicker-month").hide();
	       $("#ui-datepicker-div").position({
	           my: "center top",
	           at: "center bottom",
	           of: $(this)
	       });    
	   });	  
  
});

