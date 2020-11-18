<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kh.lml.member.model.vo.Member" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/final_main2.css">
<link rel="stylesheet" href="resources/css/jmCSS/final_mypage.css">
</head>
<body>



	<jsp:include page="../common/header.jsp" />
	
	<!-- 팔로워 모달 -->
	<div class="myModal" id="myModal" style="display: none;">
		<div class="board-detail" id="board-detail" style="display: none;">
			<div class="mo_fallower">
			
			
			</div>
		</div>
	</div>
	
	<!-- 팔로우 모달 -->
	<div class="myModal1" id="myModal1" style="display: none;">
		<div class="board-detail1" id="board-detail1" style="display: none;">
			<div class="mo_fallowoo">
			
			</div>
		</div>
	</div>
	
	<!-- ============모달 끝 ===========-->
	<section>
		<div id="myPage" class="myPage">
			<div class="my_top">
				<div class="top">
					<div class="my_photo">
						<img src="resources/images/profileImg/${loginUser.rename_profile_img}">
					</div>
					<div class="my_info">
						<div class="info">
							<h2>${loginUser.id}
								<button class="info_btn" onclick="location.href='Settings.do'">
									<img src="resources/images/jmImg/settings.png" class="btn_img">
								</button>
							</h2>
						</div>
						<div class="info">
							<div class="iftext_1">
								<span>게시글</span>
							</div>
							<div class="iftext">
								<span><a id="myfalwer" style="color: black">팔로워</a>&nbsp;
									${Follower} </span>
							</div>
							<div class="iftext">
								<span><a id="myfalowoo" style="color: black">팔로우</a>&nbsp; ${Follow}</span>
							</div>
						</div>
						<div class="info">
							<div class="name">${loginUser.uname}</div>
							<c:if test="${empty loginUser.intro}">
								<div class="iftext_2">자기소개를 등록해주세요.</div>
							</c:if>
							<c:if test="${!empty loginUser.intro}">
								<div class="iftext_2">${loginUser.intro}</div>
							</c:if>

						</div>

					</div>
				</div>
				<div></div>
			</div>
			<div class="tagmenu">
				<span><button id="my" class="tagbtn" onclick="my()">MY
						게시물</button>
					<button id="tag" class="tagbtn" onclick="tag()">태그된 게시물</button></span>
			</div>
			<div class="mytable">
				<table>
					<tr>
						<td>
							<div class="content">
								<div class=img>
									<img src="resources/images/jmImg/blue1.jpg" class="cImg">
								</div>
						</td>
						<td>
							<div class="content">
								<div class=img>
									<img src="resources/images/jmImg/blue3.jpg" class="cImg">
								</div>
						</td>
						<td>
							<div class="content">
								<div class=img>
									<img src="resources/images/jmImg/rainbow.ico" class="cImg">
								</div>
						</td>
					</tr>
				</table>

			</div>
			<div class="tagtable">
				<table>
					<tr>
						<td>
							<div class="content">
								<div class=img>
									<img src="resources/images/jmImg/blue1.jpg" class="cImg">
								</div>
						</td>
						<td>
							<div class="content">
								<div class=img>
									<img src="resources/images/jmImg/blue3.jpg" class="cImg">
								</div>
						</td>
						<td>
							<div class="content">
								<div class=img>
									<img src="resources/images/jmImg/rainbow.ico" class="cImg">
								</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="content">
								<div class=img>
									<img src="resources/images/jmImg/blue1.jpg" class="cImg">
								</div>
						</td>
						<td>
							<div class="content">
								<div class=img>
									<img src="resources/images/jmImg/blue3.jpg" class="cImg">
								</div>
						</td>
						<td>
							<div class="content">
								<div class=img>
									<img src="resources/images/jmImg/rainbow.ico" class="cImg">
								</div>
						</td>
					</tr>
				</table>

			</div>
		</div>

	</section>

	<script>
        $(document).ready(function() {
          	var id = ${loginUser.id};
            $.ajax({
				url : "werlist.do",
				data : {
					id : id
				},
				type : "post",
				success : function(data) {
					
					if (data != null) {
						console.log(data);
						var a = Object.keys(data).length;
						/* $('.mo_fallower').append("<table class='add_table'>"); */
						
						var img = '<img src=../image/3.JPG>';
						
						for(var i = 0; i<a;i++){
							console.log(data[i].id);
							console.log(data[i].rename_profile_img);
						/* $('.mo_fallower').append("<tr><td class='imgtd' rowspan='2' style='width:10%'><img class='userimg' src='resources/images/profileImg/"+data[i].rename_profile_img+"></tr></td>"); */
						$('.mo_fallower').append("<table class='add_table'><tr><td class='imgtd' rowspan='2' style='width: 10%;'><img style='width:80px; height:80px;' class='userimg' src='resources/images/profileImg/"+ data[i].rename_profile_img+"'><td>");
						$('.mo_fallower').append("<td class='idtd' style='width: 30%;'>"+data[i].id+"</td><td class='btntd' rowspan='2' style='width: 30%;'>");
						
						}
						/*  $('.mo_fallower').append("</table>"); */
					} else {
						console.log("지만아 사랑해><");
					}
				},
				error : function() {
					console.log("바보");
					//에러 로그

				}
			});
        $('mytable').show(); //페이지를 로드할 때 표시할 요소
        $('.tagtable').hide(); //페이.지를 로드할 때 숨길 요소
        $('#tag').click(function(){
        $ ('.mytable').hide(); //클릭 시 첫 번째 요소 숨김
        $ ('.tagtable').show(); //클릭 시 두 번째 요소 표시
        $('#my').click(function(){
         $ ('.tagtable').hide(); //클릭 시 첫 번째 요소 숨김
        $ ('.mytable').show(); //클릭 시 두 번째 요소 표시
        })
        return false;
        });
        });

        /* 알림 아이콘 클릭 시 아이콘 변경 */
        
        
          /* 모달팝업 디테일 */
              var modal = document.getElementById('myModal');
              var detail = document.getElementById('board-detail');
              var modalwoo = document.getElementById('myModal1');
              var detailwoo = document.getElementById('board-detail1');
              

              $('#myfalwer').click(function(){
                  $('.myModal').css('display','block');
                  $('.board-detail').css('display','block');
                
                  
              });
              $('#myfalowoo').click(function(){
                  $('.myModal1').css('display','block');
                  $('.board-detail1').css('display','block');
              });
              
              
      
              window.onclick = function(event) {
                  if (event.target == modal) {
                      modal.style.display = "none";
                      detail.style.display = "none";
                  }
                  if (event.target == modalwoo) {
                	  modalwoo.style.display = "none";
                	  detailwoo.style.display = "none";
                  }
              }
        
    </script>

</body>
</html>