<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>lml_Post_Style</title>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./././resources/css/final_post_style.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<section>
		<div class="AContent">
			<form action="stylePostUpload.do" method="post"
				enctype="multipart/form-data">
				<button type="submit" class="uploadBtn">업로드</button>
				<div class="Atable">
					<div class="Abox">
						<div class="post-div">
							<input type="hidden" name="b_user_num"
								value="${loginUser.user_num}" />
							<div class="div-img">
								<div class="post-img">스타일 이미지</div>

								<div class="post-img-div">
									<div class="img-upload1">
										<input type="file" multiple="multiple" id="uploadImg"
											name="bUploadImg"
											onchange="changeValue(this,$('#img-preview'))"
											accept="image/*" /> <input type="file" multiple="multiple"
											id="uploadImg1" name="bUploadImg"
											onchange="changeValue(this,$('#img-preview'))"
											accept="image/*" /> <img class="img-upload-icon"
											id="img-upload" src="resources/images/post/imgPlusIcon.png" />
									</div>
									<div class="img-preview" id="img-preview"></div>
								</div>

							</div>
							<div class="div-cont">
								<div class="post-cont">설명</div>
								<div class="post-cont-div">
									<div id="cont-write" class="cont-write">
										<textarea id="b_content" name="b_content" placeholder="내용을 입력해주세요">#태민 #지만  </textarea>
									</div>
									<div id="hihi" style="width: 100px; height: 100px;  margin-left: 600px;background: yellow; ">
									</div>
								</div>

							</div>
							<div class="div-cont1">
								<div id="post-cont"><h5>태그</h5></div>
								<div class="post-cont-div1">
									<form action="#" id="tag" method="post">
									<!-- 	<input type="hidden" value="" name="tag" id="tag"> -->
										<input type="text" id="hashtag" size="7" placeholder="태그입력" />
										
										<button type="button" id="tagbtn" onclick="addhash()">태그 등록</button>
									</form>
								
									
								</div>
							</div>

							<div class="div-tag">
								<div style="float: left;">
									<div class="post-tag">스타일 태그</div>
								</div>

								<div class="post-tag-div">
									<div class="tag-select">
										<select name="styleTag" class="styleTag" id="clothes">
											<option value="상의">상의</option>
											<option value="하의">하의</option>
											<option value="신발">신발</option>
											<option value="acc">acc</option>
											<option value="etc">etc</option>
										</select>&nbsp;&nbsp;&nbsp; <input type="text"
											class="styleTag tagBrand" id="brand" placeholder="직접 입력">
										<select name="styleTag" class="styleTag tagBrand"
											onchange="document.getElementById('brand').value = this.options[this.selectedIndex].value">
											<option value="선택">-----</option>
											<option value="나이키">나이키</option>
											<option value="에이블린">에이블린</option>
											<option value="에잇세컨즈">에잇세컨즈</option>
											<option value="아디다스">아디다스</option>
											<option value="자라">자라</option>
										</select>&nbsp;&nbsp;&nbsp;
										<button type="button" class="styleTagBtn"
											onclick="styleTagBtn();">추가</button>
										<div class="tagArea"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>

	</section>
	<script>
	var content = document.getElementById('b_content').innerHTML;
	var splitedArray = content.split(' ');
	var linkedContent = '';
	for(var word in splitedArray)
	{
	  word = splitedArray[word];
 	  var ab = word.replace("#",""); 
	   if(word.indexOf('#') == 0){
		   
		   word = '<a href=\'Search.do?keyword='+ab+'\'>'+word+'</a>';
	   }
	   linkedContent += word+' ';
	}
	document.getElementById('hihi').innerHTML = linkedContent; 

		
	function addhash(){
		var tag = '<a href=\'Search.do?keyword='+$('#hashtag').val()+'\'>'  +  '#'+$('#hashtag').val()+'</a><br>';
		
	document.getElementById('hihi').innerHTML+= tag;
	
	$('#hashtag').val("");
		
	}
	
	
	
	
	
        function changeValue(html, $target) {
            if (html.files && html.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $target.css('display', '');
                    $target.append('<img src="' + e.target.result + '" class="preview"/>');
                }
                reader.readAsDataURL(html.files[0]);
            }
        }

        /*iput태그 파일*/
        $(function () {    
            $('#img-upload').click(function (e) {
                e.preventDefault();   
                $('#uploadImg').click();
            });
        });

        var idnum = 77701;

        function styleTagBtn(){
            var clothes = document.getElementById('clothes').value;
            var brand = document.getElementById('brand').value;

            if(brand.length > 0){
                $('.tagArea').append('<div class="tag" id='+ idnum +'>'+
                                        '<p class="clothes">'+ clothes +'</p>'+
                                        '<p class="brand">'+ brand +'</pv>'+
                                        '<div class="deleteStyleTag"><img src="resources/images/post/close.png"></div>'+
                                        '<input type="hidden" name="bStyleTag" value='+ clothes + ' />' +	
                                        '<input type="hidden" name="bStyleTag" value='+ brand + ' />' +	
                                    '</div>');
                idnum++;
            }else{
                alert("옷 정보를 입력해주세요.");
            }
        }

        $(document).on("click", ".deleteStyleTag", function (e) {
            //var index = $(this).attr("id");
            $(this).parent().remove();
        });
    </script>
</body>
</html>