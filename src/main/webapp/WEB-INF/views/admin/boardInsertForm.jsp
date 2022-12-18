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
</head>
<body>
<form action="upload" method="post" enctype="multipart/form-data">
	<section class="main">
		<div class="wrapper">
			<div class="left-col">
				<div class="post">
					<div class="row">
						<div class="col-sm-2 imgUp">
							<div class="imagePreview"></div>
							<label class="btn btn-primary">파일업로드하기<input type="file"
								class="uploadFile img" value="Upload Photo" name="file" 
								style="width: 0px; height: 0px; overflow: hidden;">
							</label>
						</div>
						<!-- col-2 -->
					</div>
					<!-- row -->
				</div>
			</div>

			<div class="right-col">


				<h3>게시물 올리기</h3>
				<select class="select_field">
					<option selected="selected" value="">카테고리</option>
					<option value="BLACKPINK">BLACKPINK</option>
					<option value="JISOO">JISOO</option>
					<option value="JENNIE">JENNIE</option>
					<option value="ROSE">ROSE</option>
					<option value="LISA">LISA</option>
				</select> <input type="text" placeholder="제목을 입력해주세요" class="input_field" name="boardTitle"><br>
				<textarea placeholder="내용을 입력해주세요." class="textarea_field" name="boardContent"></textarea>
				<br>

				<div class='insert-submt'>
					<button class='closeBtn'>취소</button>
					<button type="submit" class='submitBtn'>등록</button>
				</div>

			</div>
		</div>
	</section>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
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
</body>
</html>