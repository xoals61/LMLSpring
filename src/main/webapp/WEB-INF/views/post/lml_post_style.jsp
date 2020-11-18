<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>lml_Post_Style</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./././resources/css/final_post_style.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<section>
        <div class="AContent">
            <button type="submit" class="uploadBtn">업로드</button>
            <div class="Atable">
                <div class="Abox">
                    <form>
                        <div class="post-div">
                            <div class="div-img">
                                <div class="post-img">스타일 이미지</div>

                                <div class="post-img-div">
                                    <div class="img-upload1" >
                                        <input type="file" id="uploadImg" name="uploadImg" onchange="changeValue(this,$('#img-preview'))"  accept="image/*" />
                                        <img class="img-upload-icon" id="img-upload" src="resources/images/post/imgPlusIcon.png" />
                                    </div>
                                    <div class="img-preview" id="img-preview"></div>
                                </div>

                            </div>
                            <div class="div-cont">
                                <div class="post-cont">설명</div>
                                <div class="post-cont-div">
                                    <div class="cont-write">
                                        <textarea placeholder="내용을 입력해주세요"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="div-tag">
                                <div style="float:left;">
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
                                        </select>&nbsp;&nbsp;&nbsp;
                                        <input type="text" class="styleTag tagBrand" id="brand" placeholder="직접 입력">
                                        <select name="styleTag" class="styleTag tagBrand" onchange="document.getElementById('brand').value = this.options[this.selectedIndex].value">
                                            <option value="0">-----</option>
                                            <option value="나이키">나이키</option>
                                            <option value="에이블린">에이블린</option>
                                            <option value="에잇세컨즈">에잇세컨즈</option>
                                            <option value="아디다스">아디다스</option>
                                            <option value="자라">자라</option>
                                        </select>&nbsp;&nbsp;&nbsp;
                                        <button type="button" class="styleTagBtn" onclick="styleTagBtn();">추가</button>
                                        <div class="tagArea">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
	<script>
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
                                        '<p class="brand">'+ brand +'</p>'+
                                        '<div class="deleteStyleTag"><img src="resources/images/post/close.png"></div>'+
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