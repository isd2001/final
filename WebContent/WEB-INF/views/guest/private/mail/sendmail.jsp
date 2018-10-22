<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div
	class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2">GROUPWARE</h1>

</div>

<form class="needs-validation" novalidate="">
	<div class="mb-3">
		<label for="text">제 목 <span class="text-muted"></span> <small
			id="size1">(0/15)</small>
		</label> <input type="text" class="form-control" id="title"
			placeholder="15글자 내외로 작성해주세요">
	</div>

	<div class="row">
		<div class="col-md-6 mb-3">
			<label for="date">날짜 </label> <input type="date" class="form-control"
				id="recipient" placeholder="" value="">
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 mb-3">
			<label for="time">시간 </label> <input type="time" class="form-control"
				id="recipient" placeholder="" value="">
		</div>
	</div>



	<div class="smart_editor2">
		<label for="text">내 용</label> <small id="size2">(0/500)</small> <input
			type="text" class="form-control" id="content"
			placeholder="500글자 내외로 작성해주세요"
			style="width: 99%; height: 100px; resize: none;">
	</div>
	<hr />

	<div class="row">
		<form action="${pageContext.servletContext.contextPath }/board/map.do" >
			<div class="col-md-1 mb-1">
				<button type="button" class="btn btn-outline-light" id="map">
					<img class="btn-img"
						src="${pageContext.servletContext.contextPath }/image/위치.PNG"
						style="opacity: 0.5;"><br /> <span class="label_text">장소</span>
				</button>
			</div>
		</form>
		<div class="col-md-1 mb-1">
			<button type="button" class="btn btn-outline-light">
				<img class="btn-img"
					src="${pageContext.servletContext.contextPath }/image/사진.PNG"
					style="opacity: 0.5;"><br /> <span class="image_text">사진</span>
			</button>
		</div>
		<div class="col-md-1 mb-1">
			<button type="button" class="btn btn-outline-light">
				<img class="btn-img"
					src="${pageContext.servletContext.contextPath }/image/동영상.PNG"
					style="opacity: 0.5;"><br /> <span class="video_text">동영상</span>
			</button>
		</div>

	</div>



	<div class="row">
		<div class="col-md-5 mb-3">
			<label for="country">Country</label> <select
				class="custom-select d-block w-100" id="country" required="">
				<option value="">Choose...</option>
				<option>United States</option>
			</select>
			<div class="invalid-feedback">Please select a valid country.</div>
		</div>
		<div class="col-md-4 mb-3">
			<label for="state">State</label> <select
				class="custom-select d-block w-100" id="state" required="">
				<option value="">Choose...</option>
				<option>California</option>
			</select>
			<div class="invalid-feedback">Please provide a valid state.</div>
		</div>
		<div class="col-md-3 mb-3">
			<label for="zip">Zip</label> <input type="text" class="form-control"
				id="zip" placeholder="" required="">
			<div class="invalid-feedback">Zip code required.</div>
		</div>
	</div>
	<hr class="mb-4">
	<div class="custom-control custom-checkbox">
		<input type="checkbox" class="custom-control-input" id="same-address">
		<label class="custom-control-label" for="same-address">Shipping
			address is the same as my billing address</label>
	</div>
	<div class="custom-control custom-checkbox">
		<input type="checkbox" class="custom-control-input" id="save-info">
		<label class="custom-control-label" for="save-info">Save this
			information for next time</label>
	</div>
	<hr class="mb-4">

	<h4 class="mb-3">Payment</h4>

	<div class="d-block my-3">
		<div class="custom-control custom-radio">
			<input id="credit" name="paymentMethod" type="radio"
				class="custom-control-input" checked="" required=""> <label
				class="custom-control-label" for="credit">Credit card</label>
		</div>
		<div class="custom-control custom-radio">
			<input id="debit" name="paymentMethod" type="radio"
				class="custom-control-input" required=""> <label
				class="custom-control-label" for="debit">Debit card</label>
		</div>
		<div class="custom-control custom-radio">
			<input id="paypal" name="paymentMethod" type="radio"
				class="custom-control-input" required=""> <label
				class="custom-control-label" for="paypal">PayPal</label>
		</div>
	</div>

	<hr class="mb-4">
	<button class="btn btn-primary btn-lg btn-block" type="submit" id="b">등록하기</button>
</form>






<script>
	$("#title").on("keyup", function() {
		var len = $("#title").val().length;
		console.log(len);

		var html = "(" + len + "/15)";
		document.getElementById("size1").innerHTML = html;

		if (len >= 15) {
			$("#b").prop("disabled", true);
		} else {
			$("#b").prop("disabled", false);
		}

	});

	$("#content").on("keyup", function() {
		var len = $("#content").val().length;
		console.log(len);

		var html = "(" + len + "/500)";
		document.getElementById("size2").innerHTML = html;

		if (len >= 500) {
			$("#b").prop("disabled", true);
		} else {
			$("#b").prop("disabled", false);
		}

	});
	
	$("#map").on("click",function(){
		window.open("${pageContext.servletContext.contextPath }/board/map.do","map","width=500,height=500");
		
		
	});
</script>


</div>