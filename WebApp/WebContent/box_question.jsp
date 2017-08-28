<%@ page pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-lg-8">
	<div class="thumbnail" style="background-color:rgb(238,238,238); border-style:none;">
		<h5 id="question_title" style="font-weight:bold; font-size:medium; margin-top:-15px;">Question:${sessionScope.question.number}</h5>
		<pre id="question_content" style="font-size:15px; border:none; margin-top:-10px; padding:0px; background-color:rgb(238,238,238);">${sessionScope.questionContent}</pre>
		
		<form id="choose_answer_form" method="post" action="#">
			<c:forEach items="${sessionScope.choices}" var="choice" varStatus="status">
				<pre style="background-color:rgb(238,238,238); border:none; margin-top:-10px; padding-top:0px; font-size:13px;"><input type="checkbox" name="selectBox" confirm="no" value="${sessionScope.choicesCode[status.index]}">&nbsp;${choice}</pre>
			</c:forEach>
		</form>
		
	</div>
</div>

<script type="text/javascript">

//---------------------------------------------------------------------------------------
	var quantity = ${sessionScope.quantity};
	window.onload = function(){
		//alert($("input[name='selectBox']:eq(2)").val());
		if(quantity > 1){
			//alert(quantity);
			$("input[name='selectBox']").attr("type", "checkbox");
		}else{
			$("input[name='selectBox']").attr("type", "radio");
		}
	}
//---------------------------------------------------------------------------------------	
	var number = 0;
	$("input[name='selectBox']").click(function(){
		$("input[name='selectBox']").each(function(i,v){
			if($(this).prop("checked") && $(this).attr("confirm") == "no"){
				number++;
				$(this).attr("confirm", "yes");
			}
			if(!$(this).prop("checked") && $(this).attr("confirm") == "yes"){
				number--;
				$(this).attr("confirm", "no");
			}
		});
		$("input[name='selectBox']").each(function(i,v){
			if(number == quantity){
				if(!$(this).prop("checked") && $(this).attr("confirm") == "no"){
					$(this).prop("disabled", "disabled");
				}
			}else{
				$(this).removeAttr("disabled");
			}
		});
	});
//---------------------------------------------------------------------------------------			
</script>