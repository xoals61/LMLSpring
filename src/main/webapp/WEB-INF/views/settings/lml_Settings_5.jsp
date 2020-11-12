<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>lml_Follow</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
  
    <link rel="stylesheet" href="resources/css/final_Settings_address.css">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <section>
        <div class="AContent">
            <div class="Atable">
                <div class="Abox">
                   <div class="lContent">
                    <div class="lmenu">
                       <li class="minimenu"><a href="Settings.do" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Mprofile.png">프로필 수정</a></li>
                        <li class="minimenu"><a href="Settings2.do" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Mrock.png">비밀번호 변경</a></li>
                        <li class="minimenu put">
							<c:url var="followList" value="Settings5.do">
								<c:param name="uNum" value="${ loginUser.user_num }"/>
							</c:url>
                        	<a href="${followList}" class="Ma"> 
                        		<img class="mainbtn" src="resources/images/icon/settings/xxx.png">친구관리
                        	</a>
						</li>
                        <li class="minimenu"><a href="Settings3.do" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Memail.png">이메일 문의</a></li>
                     
                    </div>
                </div>
                <div class="rContent" id="rContent">
                        <div class="friends">
                            <input class="fsearch" type="text">
                            <input class-="fbtn" type="button" value="검색">
                        </div>
                        <div class="change_address">
                            <!-- <button>FALLOWER</button>
                            <button>FALOWOO</button>
                            <button>BLOCK FRIENDS</button> -->
                            <ul class="tags">
                                <li><a id="add_wer" href="#">팔로워</a></li><br><br>
                                <li><a id="add_woo" href="#">팔로우</a></li><br><br>
                                <li><a id="add_block" href="#">차단</a></li>
                            </ul>
                        </div>
                    <div class="address" id="address">
                    	<!-- 팔로워친구 -->
                    	<c:if test="${ !empty FollowerList }">
							<c:forEach var="fwer" items="${ FollowerList }">
	                       		<table class="add_table">
		                            <tr>
		                                <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/${fwer.profile_img}" alt="#"></td>
		                                <td class="idtd" style="width: 30%;">${fwer.id }</td>
		                                <td class="btntd" rowspan="2" style="width: 30%;">
		                                	<c:forEach var="check" items="${ FollowList }">
			                                	<c:if test="${fwer.id eq check.id}">
													<c:set var="followBtn" value="following"/>
													<c:if test="${check.f_block eq 'Y'.charAt(0) }">
														<c:set var="followBtn" value="block"/>
													</c:if>
												</c:if>
											</c:forEach>
											
											<c:choose>
												<c:when test="${followBtn eq 'following'}">
													<input class="button1" id="${fwer.from_follower }" type="button" value="팔로잉">
												</c:when>
												<c:when test="${followBtn eq 'block'}">
													<input class="button3" id="${fwer.from_follower }" type="button" value="차단">
												</c:when>
												<c:when test="${followBtn ne 'following'}">
													<input class="button2" id="${fwer.from_follower }" type="button" value="팔로우">
												</c:when>
											</c:choose>
											
										</td>
		                            </tr>
		                            <tr>
		                                <td>${fwer.uname }</td>
		                            </tr>
		                        </table>
	                       </c:forEach>
						</c:if>
						<c:if test="${ empty FollowerList }">
							<table class="add_table">
			                    <tr>
			                        <td class="imgtd" rowspan="2" style="width: 10%;"></td>
			                        <td class="idtd" style="width: 30%;">팔로워 없음</td>
			                        <td class="btntd" rowspan="2" style="width: 30%;"></td>
			                    </tr>
			                    <tr>
			                        <td></td>
			                    </tr>
		                	</table>
						</c:if>
                    </div>
                    <div id="address_woo" class="address">
	                    <!-- 팔로우친구 -->
	                    <c:if test="${ !empty FollowList }">
							<c:forEach var="f" items="${ FollowList }">
							<c:set var="fromFollow" value="${f.from_follow}"/>
		                    	<table class="add_table">
			                         <tr>
			                             <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/${f.profile_img }" alt="#"></td>
			                             <td class="idtd" style="width: 30%;">${f.id }</td>
			                             <td class="btntd" rowspan="2" style="width: 30%;"><input class="button1" id="${f.to_follow }" type="button" value="팔로잉"></td>
			                         </tr>
			                         <tr>
			                             <td>${f.uname }</td>
			                         </tr>
			                     </table>
		                    </c:forEach>
						</c:if>
						<c:if test="${ empty FollowList }">
							<table class="add_table">
				                  <tr>
				                      <td class="imgtd" rowspan="2" style="width: 10%;"></td>
				                      <td class="idtd" style="width: 30%;">다른 사람을 팔로우 해보셔</td>
				                      <td class="btntd" rowspan="2" style="width: 30%;"></td>
				                  </tr>
				                  <tr>
				                      <td></td>
				                  </tr>
			              	</table>
						</c:if>
                	</div>
                <div id="address_block" class="address">
                    <!-- 차단친구 -->
                    	<c:if test="${ !empty BlockList }">
							<c:forEach var="bl" items="${ BlockList }">
	                       		<table class="add_table">
		                            <tr>
		                                <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/${bl.profile_img }" alt="#"></td>
		                                <td class="idtd" style="width: 30%;">${bl.id }</td>
		                                <td class="btntd" rowspan="2" style="width: 30%;"><input class="button3" type="button" value="차단"></td>
		                            </tr>
		                            <tr>
		                                <td>${bl.uname }</td>
		                            </tr>
		                        </table>
	                       </c:forEach>
						</c:if>
						<c:if test="${ empty BlockList }">
							<table class="add_table">
			                    <tr>
			                        <td class="imgtd" rowspan="2" style="width: 10%;"></td>
			                        <td class="idtd" style="width: 30%;">차단한 사람 없음</td>
			                        <td class="btntd" rowspan="2" style="width: 30%;"></td>
			                    </tr>
			                    <tr>
			                        <td></td>
			                    </tr>
		                	</table>
						</c:if>
            	</div>
               </div>
                </div>
            </div>
        </div>
    </section>

	<script>
		/*선택 메뉴 고정*/
		$(document).ready(function(){
			$('.minimenu').on('click', function(){
				$(this).addClass('put');
				$(this).siblings().removeClass('put');
			});
		});
		</script>

      <script>
        // button2 팔로우 버튼 눌렀을 때
        $(function(){
			$('.button2',this).click(function(){
				
				if($(this).attr('value') == "팔로우"){
					var followQ = confirm('팔로우 하시겠습니까?');
					
					if(followQ){
						var toFollow = $(this).attr('id');	// 팔로우 할 상대
						var fromFollow = '<c:out value="${fromFollow}"/>';	// 본인
						
						console.log("toFollow : " + toFollow);
						console.log("fromFollow : " + fromFollow);
						
						$.ajax({
							url:"followBtn.do",
							data:{toFollow:toFollow, fromFollow:fromFollow},
							type:"post",
							success:function(data){
								if(data == "success"){
									$('#'+toFollow).attr('class','button1');
									$('#'+toFollow).attr('value','팔로잉');
									getFollowList();
								}else{
									alert("실패");
								}
							},
							error:function(jqxhr, textStatus,errorThrown){
								console.log("ajax 처리 실패");
							}
						});
						
						function getFollowList(){
				        	var uNum = toFollow;
				        	console.log("uNum : " + uNum);
				        	$.ajax({
				        		url:"fSelectUser.do",
				        		data:{uNum:uNum},
				        		dataType:"json",
				        		success:function(data){
				        			if(data.id.length > 0){
				        				$("#address_woo").append('<table class="add_table">' +
											                         '<tr>' +
										                             '<td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/'+data.profile_img+'" alt="#"></td>'+
										                             '<td class="idtd" style="width: 30%;">'+data.id+'</td>'+
										                             '<td class="btntd" rowspan="2" style="width: 30%;"><input class="button1" type="button" value="팔로잉"></td>'+
										                         '</tr>'+
										                         '<tr>'+
										                             '<td>'+data.uname+'</td>'+
										                         '</tr>'+
										                     '</table>');
				        			}else{
										alert("실패");
									}
								},
								error:function(request,status,errorData){
									console.log("user 처리 실패");
									console.log(request.status + ":" + errorData);
								}
				        	});
				        }
					}else{
						
					}
				}else{
					
				}
			});
			
			$('.button1',this).click(function(){
				
				console.log($(this).attr('value'));
				
				if($(this).attr('value') == "팔로잉"){
					
					var unfollowQ = confirm('팔로우를 취소하시겠습니까?');
					
					if(unfollowQ){
						var toUnFollow = $(this).attr('id');	// 팔로우 취소 할 상대
						var fromFollow = '<c:out value="${fromFollow}"/>';	// 본인
						
						console.log("toUnFollow : " + toUnFollow);
						console.log("fromFollow : " + fromFollow);
						
						$.ajax({
							url:"unfollowBtn.do",
							data:{toUnFollow:toUnFollow, fromFollow:fromFollow},
							type:"post",
							success:function(data){
								if(data == "success"){
									$('#'+toUnFollow).attr('class','button2');
									$('#'+toUnFollow).attr('value','팔로우');
									//getFollowList();
								}else{
									alert("실패");
								}
							},
							error:function(jqxhr, textStatus,errorThrown){
								console.log("ajax 처리 실패");
							}
						});
						
						/* function getFollowList(){
				        	var uNum = toFollow;
				        	console.log("uNum : " + uNum);
				        	$.ajax({
				        		url:"fSelectUser.do",
				        		data:{uNum:uNum},
				        		dataType:"json",
				        		success:function(data){
				        			if(data.id.length > 0){
				        				$("#address_woo").append('<table class="add_table">' +
											                         '<tr>' +
										                             '<td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/'+data.profile_img+'" alt="#"></td>'+
										                             '<td class="idtd" style="width: 30%;">'+data.id+'</td>'+
										                             '<td class="btntd" rowspan="2" style="width: 30%;"><input class="button1" type="button" value="팔로잉"></td>'+
										                         '</tr>'+
										                         '<tr>'+
										                             '<td>'+data.uname+'</td>'+
										                         '</tr>'+
										                     '</table>');
				        			}else{
										alert("실패");
									}
								},
								error:function(request,status,errorData){
									console.log("user 처리 실패");
									console.log(request.status + ":" + errorData);
								}
				        	});
				        } */
					}else{
						
					}
					
				}else{
					
				}
			});
		});
        
     
        $(document).ready(function() {
	        $('#address').show(); //페이지를 로드할 때 표시할 요소
	        $('#address_woo').hide(); //페이지를 로드할 때 숨길 요소
	        $('#address_block').hide(); //페이지를 로드할 때 숨길 요소
	
	        return false;
        });

        $('#add_woo').click(function(){
	        $ ('#address').hide(); //클릭 시 첫 번째 요소 숨김
	        $ ('#address_block').hide(); //클릭 시 세번째 요소 숨김
	        $ ('#address_woo').show(); //클릭 시 두 번째 요소 표시
	        return false;
        });
        
        $('#add_block').click(function(){
	        $ ('#address').hide(); //클릭 시 첫 번째 요소 숨김
	        $ ('#address_woo').hide(); //클릭 시 두 번째 요소 숨김
	        $ ('#address_block').show(); //클릭 시 세 번째 요소 표시
	        return false;
        });
        
        $('#add_wer').click(function(){
	        $ ('#address_woo').hide(); //클릭 시 첫 번째 요소 숨김
	        $ ('#address_block').hide(); //클릭 시 두 번째 요소 숨김
	        $ ('#address').show(); //클릭 시 세 번째 요소 표시
	        return false;
        });

        </script>


      
</body>
</html>