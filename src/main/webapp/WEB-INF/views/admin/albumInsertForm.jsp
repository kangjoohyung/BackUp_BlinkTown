<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/board/boardInsertForm.css">
<style type="text/css">
.input_field{
margin-bottom: 5px;
 border: 1px solid #F4A7BB50;
 padding: .5em .75em;
 width: 90%;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox label {
  display: inline-block;
  float:left;
  padding: .4em .75em;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #F4A7BB;
  cursor: pointer;
  border: 1px solid #F4A7BB;
  border-bottom-color: #F4A7BB;
  border-radius: .25em;
  margin: 10px 0px 20px 0px;
}

/* named upload */
.filebox .upload-name {
  float:left;
  display: block;
  width:70%;
  padding: .4em .75em;  /* label의 패딩값과 일치 */
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #000000;
  border: 1px solid #F4A7BB50;
  border-bottom-color: #F4A7BB50;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
  color: #ffffff;
  margin: 10px 5px 20px 0px;
}
h3{
margin-bottom: 20px;
}
.select_field{
margin-right: 30px;
margin-bottom: 8px;
}
</style>
</head>
<body>
<form action="${pageContext.request.contextPath}/shop/insertAlbum" method="post" enctype="multipart/form-data">
	<section class="main">
		<div class="wrapper">
			<div class="left-col">
				<div class="post">
					<div class="row">
						<div class="col-sm-2 imgUp">
							<div class="imagePreview"></div>
							<label class="btn btn-primary">메인이미지업로드
								<input type="file" class="uploadFile img" value="Upload Photo" name="mainImg" style="width: 0px; height: 0px; overflow: hidden;">
							</label>
						</div>
						<!-- col-2 -->
					</div>
					<!-- row -->
				</div>
			</div>

			<div class="right-col">


 				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
				<h3>Album Insert</h3>
				<select class="select_field" id="productMembershipOnly" name="productMembershipOnly">
					<option selected="selected" value="">Type</option>
					<option value="1">Membership</option>
					<option value="0">Normal</option>
				</select>
				<input type="text" name="categoryCode" value="A" class="input_field" readonly="readonly"><br>
				<input type="text" name="productCode" placeholder="상품코드" class="input_field"><br>
				<input type="text" name="productName" placeholder="상품명 [KOR]" class="input_field"><br>
				<input type="text" name="productEngName" placeholder="상품명 [ENG]" class="input_field"><br>
				<input type="text" name="productPrice" placeholder="가격" class="input_field"><br>
				<input type="number" name="productStock" placeholder="재고" class="input_field"><br>
				<input type="text" name="productSize" placeholder="사이즈" class="input_field"><br>
				<input type="text" name="albumComponent" placeholder="구성" class="input_field"><br>
				<input type="text" name="albumReleaseDate" placeholder="발매일" class="input_field"><br>
				<div class="filebox">
				  <input class="upload-name" value="상세페이지이미지" disabled="disabled">
				
				  <label for="ex_filename">업로드</label> 
				  <input type="file" id="ex_filename" class="upload-hidden" name="detailImg"> 
				</div>
								<br>

				<div class='insert-submt'>
					<button class='closeBtn'>취소</button>
					<button type="submit" class='submitBtn'>등록</button>
				</div>

			</div>
		</div>
	</section>
</form>
	<div class="background-img">
		<div class="cover">
			<p class="first-parallel"></p>
		</div>
		<div class="cover">
			<p class="second-parallel"></p>
		</div>
		<div class="cover">
			<p class="third-parallel"></p>
		</div>
		<div class="cover">
			<p class="forth-parallel"></p>
		</div>
	</div>
	<script type="text/javascript">
	const pTag1 = document.querySelector('.first-parallel')
	const pTag2 = document.querySelector('.second-parallel')
	const pTag3 = document.querySelector('.third-parallel')
	const pTag4 = document.querySelector('.forth-parallel')

	
	const textArr1 = ' BLACKPINK IN YOUR AREA BLACKPINK IN YOUR AREA BLACKPINK IN YOUR AREA'.split(' ')

	let count1 = 0
	let count2 = 0
	let count3 = 0
	let count4 = 0

	
	initTexts(pTag1, textArr1)
	initTexts(pTag2, textArr1)
	initTexts(pTag3, textArr1)
	initTexts(pTag4, textArr1)


	function initTexts(element, textArray) {
	  textArray.push(...textArray)
	  for (let i = 0; i < textArray.length; i++) {
	    element.innerText += `${'${textArray[i]}'}\u00A0\u00A0\u00A0\u00A0`
	  }
	}

	function marqueeText(count, element, direction) {
	  if (count > element.scrollWidth / 2) {
	    element.style.transform = `translate3d(0, 0, 0)`
	    count = 0
	  }
	  element.style.transform = `translate3d(${'${direction * count}'}px, 0, 0)`

	  return count
	}

	function animate() {
	  count1++
	  count2++
	  count3++
	  count4++


	  count1 = marqueeText(count1, pTag1, -1)
	  count2 = marqueeText(count2, pTag2, 1)
	  count3 = marqueeText(count3, pTag3, -1)
	  count4 = marqueeText(count4, pTag4, 1)


	  window.requestAnimationFrame(animate)
	}

	function scrollHandler() {
	  count1 += 15
	  count2 += 15
	  count3 += 15
	  count4 += 15

	}

	window.addEventListener('scroll', scrollHandler)
	animate()
</script>
<script type="text/javascript">

$(function() {
    $(document).on("change",".uploadFile", function()
    {
    		var uploadFile = $(this);
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
 
        if (/^image/.test( files[0].type)){ // only image file
            var reader = new FileReader(); // instance of the FileReader
            reader.readAsDataURL(files[0]); // read the local file
 
            reader.onloadend = function(){ // set image data as background of div
                //alert(uploadFile.closest(".upimage").find('.imagePreview').length);
uploadFile.closest(".imgUp").find('.imagePreview').css("background-image", "url("+this.result+")");
            }
        }
      
    });
});
</script>

<script type="text/javascript">
$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	  fileTarget.on('change', function(){  // 값이 변경되면
	    if(window.FileReader){  // modern browser
	      var filename = $(this)[0].files[0].name;
	    } 
	    else {  // old IE
	      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	    }
	    
	    // 추출한 파일명 삽입
	    $(this).siblings('.upload-name').val(filename);
	  });
	}); 
</script>
</body>
</html>