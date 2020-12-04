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
	
	
		<div class="myModal2" id="myModal2" style="display: none;">
			<div class="board-detail2" id="board-detail2" style="display: none;">
				
			</div>
		</div>
		
		
	<div class="myModal" id="myModal" style="display: none;">
		<div class="board-detail" id="board-detail" style="display: none;">
		<h4 style="margin: 13px 0px 0 206px;">팔로워</h4>
			<div class="mo_fallower">
			
			
			</div>
		</div>
	</div>
	
	<!-- 팔로우 모달 -->
	<div class="myModal1" id="myModal1" style="display: none;">
		<div class="board-detail1" id="board-detail1" style="display: none;">
		<h4 style="margin: 13px 0px 0 206px;">팔로우</h4>
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
						<img class="frofile" src="resources/images/profileImg/${loginUser.rename_profile_img}">
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
								<span><a id="myboard" style="color: black">게시글</a>&nbsp;
									<span id="boardCount">${boardCount}</span></span>
							</div>
							<div class="iftext">
								<span><a id="myfalwer" style="color: black">팔로워</a>&nbsp;
									<span id="follwerCount">${Follower}</span> </span>
							</div>
							<div class="iftext">
							<span><a id="myfalowoo" style="color: black">팔로우</a>&nbsp;<span id="followCount">${Follow}</span></span>
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
				<c:forEach var="myBoard" items="${Myboardlist }" varStatus="status" >
					<c:if test="${status.index mod 3 eq 0}">
					<tr>
					</c:if>
						<td>
							<div class="content">
								<div class=img>
									<img src="resources/buploadFiles/${myBoard.image1}" class="cImg">
								</div>
						</td>
						
					<c:if test="${status.index mod 3 eq 2}">
					</tr>
					</c:if>
					</c:forEach>
				</table>

			</div>
		
		</div>

	</section>

	<script>
        $(document).ready(function() {
          	var id = "${loginUser.id}";
          //팔로워 목록 불러오는 ajax
            $.ajax({
				url : "werlist.do",
				data : {
					id : id
				},
				type : "post",
				success : function(data) {
					
					if (data != null) {
						console.log("여기 팔로워 리스트 "+data);
						var a = Object.keys(data).length;
						/* $('.mo_fallower').append("<table class='add_table'>"); */
						
					
						
						for(var i = 0; i<a;i++){
							console.log(data[i].id);
							console.log(data[i].rename_profile_img);
							var value;
							if(data[i].btn=="button1"){
								value = '팔로잉';
							}else{
								value = '팔로우';
							}
							
							
							
							var img = "<table class='add_table'><tr><td class='imgtd' rowspan='2' style='width: 10%;'><a class='taga' href='userPage.do?id="+data[i].id+"'><img style='width:75px; height:69px;' class='userimg' src='resources/images/profileImg/"+ data[i].rename_profile_img+"'></a></td>"+
							"<td class='idtd' style='width: 30%;'><a class='taga' href='userPage.do?id="+data[i].id+"'>"+data[i].id+"</a></td><td class='btntd' rowspan='2' style='width: 30%;'>"+ "<input class='"+data[i].btn+"' id='"+ data[i].from_follower +"'  name='"+data[i].btn+"' type='button' value='"+value+"' onclick='followBtn(this.name, this.id);'>"
									+"</td></tr><tr><td  class='nametd'><a class='taga' href='userPage.do?id="+data[i].id+"'>"+data[i].uname+"</a></td></tr></table>";
							
						/* $('.mo_fallower').append("<tr><td class='imgtd' rowspan='2' style='width:10%'><img class='userimg' src='resources/images/profileImg/"+data[i].rename_profile_img+"></tr></td>"); */
						/* $('.mo_fallower').append("<table class='add_table'><tr><td class='imgtd' rowspan='2' style='width: 10%;'><img style='width:80px; height:80px;' class='userimg' src='resources/images/profileImg/"+ data[i].rename_profile_img+"'><td>");
						$('.mo_fallower').append("<td class='idtd' style='width: 30%;'>"+data[i].id+"</td><td class='btntd' rowspan='2' style='width: 30%;'>");
						$('.mo_fallower').append("<input class='button2'  name='button2' type='button' value='팔로우' onclick='followBtn(this.name, this.id);'>");
						$('.mo_fallower').append("</td></tr><tr><td>"+data[i].uname+"</td> </tr> </table>"); */
							$('.mo_fallower').append(img);
						}
						/*  $('.mo_fallower').append("</table>"); */ 
					} else {
				
					}
				},
				error : function() {
					console.log("바보");
					//에러 로그

				}
			});
            //팔로우 목록 불러오는 ajax
            $.ajax({
				url : "woolist.do",
				data : {
					id : id
				},
				type : "post",
				success : function(data) {
					
					if (data != null) {
						console.log("여기 팔로우 리스트"+data);
						var a = Object.keys(data).length;
						/* $('.mo_fallower').append("<table class='add_table'>"); */
						
					
						
						for(var i = 0; i<a;i++){
							console.log(data[i].id);
							console.log(data[i].rename_profile_img);
							var value;
							if(data[i].btn=="button1"){
								value = '팔로잉';
							}else{
								value = '팔로우';
							}
							
							
							var img = "<table class='add_table'><tr><td class='imgtd' rowspan='2' style='width: 10%;'><a class='taga' href='userPage.do?id="+data[i].id+"'><img style='width:75px; height:69px;' class='userimg' src='resources/images/profileImg/"+ data[i].rename_profile_img+"'></a></td>"+
							"<td class='idtd' style='width: 30%;'><a class='taga' href='userPage.do?id="+data[i].id+"'>"+data[i].id+"</a></td><td class='btntd' rowspan='2' style='width: 30%;'>"+ "<input class='"+data[i].btn+"' id='"+ data[i].to_follow +"'  name='"+data[i].btn+"' type='button' value='"+value+"' onclick='followBtn(this.name, this.id);'>"
									+"</td></tr><tr><td  class='nametd'><a class='taga' href='userPage.do?id="+data[i].id+"'>"+data[i].uname+"</a></td></tr></table>";
							
						/* $('.mo_fallower').append("<tr><td class='imgtd' rowspan='2' style='width:10%'><img class='userimg' src='resources/images/profileImg/"+data[i].rename_profile_img+"></tr></td>"); */
						/* $('.mo_fallower').append("<table class='add_table'><tr><td class='imgtd' rowspan='2' style='width: 10%;'><img style='width:80px; height:80px;' class='userimg' src='resources/images/profileImg/"+ data[i].rename_profile_img+"'><td>");
						$('.mo_fallower').append("<td class='idtd' style='width: 30%;'>"+data[i].id+"</td><td class='btntd' rowspan='2' style='width: 30%;'>");
						$('.mo_fallower').append("<input class='button2'  name='button2' type='button' value='팔로우' onclick='followBtn(this.name, this.id);'>");
						$('.mo_fallower').append("</td></tr><tr><td>"+data[i].uname+"</td> </tr> </table>"); */
							$('.mo_fallowoo').append(img);
							
						}
						/*  $('.mo_fallower').append("</table>"); */ 
					} else {
				
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
        
              $(document).ready(function(){
              	
              	var uNum = ${loginUser.user_num};
              	
              
              });
              
              
              
              //팔로우 언팔로우 ~~~~
              
              
              function followBtn(name, id){
      			
      			if(name == 'button1'){	// 언팔로우
      				console.log(name);
      				console.log(id);
      			
      				var followQ = confirm('언팔로우 하시겠습니까?');
      				
      				if(followQ){
      					
      					console.log('woo 언팔');
      					
      					var toUnFollow = id;	// 팔로우 취소 할 상대
      					var fromFollow = '${loginUser.user_num}';	// 본인
      				
      					console.log("Un - to : " + toUnFollow + " / from : " + fromFollow);
      					
      					$.ajax({
      						url:"unfollowBtn.do",
      						data:{toUnFollow:toUnFollow, fromFollow:fromFollow},
      						type:"post",
      						success:function(data){
      							if(data == "success"){
      								$('.board-detail1').find('#'+id).parent().parent().parent().parent().remove();
      								$('#followCount').html(Number($('#followCount').html())-1);
      								$('.mo_fallower').find('#'+id).prop("name",'button2');
      								$('.mo_fallower').find('#'+id).prop("class",'button2');
      								$('.mo_fallower').find('#'+id).prop("value",'팔로우');
      							}else{
      								alert("실패");
      							}
      						},
      						error:function(jqxhr, textStatus,errorThrown){
      							console.log("ajax 처리 실패");
      						}
      					});
      					
      				}else{	alert('언팔 불가능');	}
      				
      			}else if(name == 'button2'){	// 팔로우
      				
      				var followQ = confirm('팔로우 하시겠습니까?');
      				
      				if(followQ){
      					
      					var toFollow = id;	// 팔로우 할 상대
      					var fromFollow = '${loginUser.user_num}';	// 본인
      					
      					$.ajax({
      						url:"followBtn.do",
      						data:{toFollow:toFollow, fromFollow:fromFollow},
      						type:"post",
      						success:function(data){
      							if(data == "success"){
      								console.log("followBtn");
      								$('.mo_fallower').find('#'+id).prop("class",'button1');
      								$('.mo_fallower').find('#'+id).prop("value",'팔로잉');
      								$('.mo_fallower').find('#'+id).prop("name",'button1');
      								$('#followCount').html(Number($('#followCount').html())+1);
      								var btn = $('.mo_fallower').find('#'+id).parent().parent().parent().parent().clone();
      								$('.mo_fallowoo').append(btn);
      							}else{
      								alert("실패");
      							}
      						},
      						error:function(jqxhr, textStatus,errorThrown){
      							console.log("ajax 처리 실패");
      						}
      					});
      				}else{	alert('팔로우 불가능');	}
      				
      			}else if(name == 'button3'){
      				console.log('차단' + name);
      			}
      		}
           
              
              
              
              function my(){
            	  location.href="MyPage.do?uNum=${loginUser.user_num}";
            	  
              }
              
              
              
              
              function tag(){
           
            	  location.href="myTagPost.do?uNum=${loginUser.user_num}";
              }
              
    </script>

</body>
</html>