<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/final_search.css">
<link rel="stylesheet" href="resources/css/final_detail.css">
<link rel="stylesheet" href="resources/css/final_main2.css">


</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<section>
		<div class="myModal" id="myModal" style="display: none;">
			<div class="board-detail" id="board-detail" style="display: none;">

			</div>
		</div>

		<div class="hashtagSection">
			<div class="hashInfo">
				<div class="hashtag">Tag 😜 ; ${keyword}</div>
				<a href="SearchHash.do?keyword=${keyword}">
					<div class="hashMore">
						<c:if test="${tagCount > 1}">
                        	${tagCount} 개의 게시글 더보기
                        </c:if>
					</div>
				</a>
			</div>
			<div class="hashTable">
				<c:if test="${ !empty tagpost}">
					<table id="table">
						<c:forEach var="tagBoard" items="${tagpost}" varStatus="status">
						<c:set var="i" value="${status.index}" />
							<c:if test="${status.index mod 3 eq 0}">
								<tr>
							</c:if>
							<td>
								<div class="content" onclick="modalDetail('${tagBoard.b_num}')">
									<div class=img>
										<img src="resources/buploadFiles/${tagBoard.image1}"
											class="cImg">
									</div>
									<div class="chover">
										<div class="hover-detail-content"
											onclick="modalDetail('${tagBoard.b_num}');"></div>
										<div class="chContnet">
											<div class="user">
												<div class="userImg">
													<a href="userPage.do?id=${ tagBoard.b_user_id }"><img
														src="resources/images/profileImg/${ tagBoard.b_profile_img}"></a>
														
												</div>
												<a href="userPage.do?id=${ tagBoard.b_user_id }">
												<div class="userId">${ tagBoard.b_name}</div></a>
											</div>
											<div class="con" onclick="modalDetail('${tagBoard.b_num}');">
												<div class="userCon">
													<p>${ tagBoard.b_content}</p>
												</div>
											</div>
											<div class="cBtn">
												<div class="cHeart">
												<img src="resources/images/icon/main/heart.png"
														class="cheart">
												</div>
												<div class="cComment"
													onclick="modalDetail('${tagBoard.b_num}');">
													<div class="cbox"></div>
													<img src="resources/images/icon/main/comment.png">
												</div>
												<div class="cEtc">
													<img src="resources/images/icon/main/etc.png">
												</div>
											</div>
										</div>
									</div>
							</td>

							<c:if test="${status.index mod 3 eq 2}">
								</tr>
							</c:if>

						</c:forEach>

					</table>
				</c:if>
				<c:if test="${ empty tagpost}">
					<br>검색 결과가 없습니다
					</c:if>
			</div>
		</div>
	</section>
	<div class="divhr">
		<hr class="hr">
	</div>
	<section>
		<div class="userSection">
			<div class="userInfo">
				<div class="suser">사용자</div>
				<a href="SearchUser.do?keyword=${keyword}">
					<div class="suserMore">
						<c:if test="${userCount > 6}">
                        	${userCount} 명의 사용자 더보기
                        </c:if>
					</div>
				</a>
			</div>
			<div class="userTable">
				<table>
					<c:if test="${ !empty searchUser }">
						<c:set var="i" value="0" />
						<c:forEach var="r" begin="1" end="3">
							<tr>
								<c:forEach var="c" begin="1" end="2">
									<c:if test="${ !empty searchUser[i] }">
										<td><c:set var="uNum" value="${searchUser[i].user_num }" />
											<div class="infoDiv">
												<div class="uImg" onclick="infoPage('${searchUser[i].id}');">
													<img
														src="resources/images/profileImg/${searchUser[i].rename_profile_img}">
												</div>
												<div class="uName"
													onclick="infoPage('${searchUser[i].id}');">
													<div class="uid">${searchUser[i].id}</div>
													<div class="uname">${searchUser[i].uname}</div>
												</div>
												<c:set var="k" value="0"/>
												<c:forEach var="follow" items="${followlist }">
												
												 <c:if test="${follow.to_follow+0 == searchUser[i].user_num+0}">
												 	<c:set var="k" value="1"/>				
												 </c:if>
												</c:forEach>
												
												<c:if
													test="${ !empty loginUser.id && loginUser.user_num != searchUser[i].user_num && k eq 0}">
													
													<div class="follow" id="${searchUser[i].user_num }">
														<div class="">팔로우</div>
													</div>
												</c:if>
												
												
											</div></td>
										<c:set var="i" value="${i+1}" />
									</c:if>
									<c:if test="${ empty searchUser[i] }">
										<td>
											<div class="noinfoDiv"></div>
										</td>
									</c:if>
								</c:forEach>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${ empty searchUser }">
						<br>&nbsp;&nbsp;&nbsp;&nbsp;검색 결과가 없습니다
					</c:if>
				</table>
			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />

	<script>
    
	// 게시물 마우스오버
	 function boardHover(){
	 $('.chover').hide();
	    $('.content').mouseover(function(){
	        $('.chover',this).show();
	    });
	    $('.content').mouseout(function(){
	        $('.chover').hide();
	    });
	    
	    /* 게시물 좋아요 아이콘 클릭 시 아이콘 변경 */
		$(".cHeart").click(function(){
			if($('.cheart',this).attr('src') == "resources/images/icon/main/heart.png"){
				$('.cheart',this).attr('src','./resources/images/icon/main/heart2.png');
			}else{
		  		$('.cheart',this).attr('src','resources/images/icon/main/heart.png');
		 	}
		});
	}


    
    
    
    
    
    
    
    
    
	function modalDetail(bnum){
		
		var modal = document.getElementById('myModal');
		var detail = document.getElementById('board-detail');
		var content = document.getElementById('conte');
		
		$('.myModal').css('display','block');
		$('.board-detail').css('display','block');
		
		$.ajax({
			url:"BoardDetail.do",
			data:{bnum:bnum},
			dataType:"JSON",
			success:function(data){	
				hashAjax();
				getReplyList();
				
				$('.board-detail').append('<div class="board-img">'+
						'<img src="resources/buploadFiles/'+ data[0].image1 +'">'+
						'</div>'+
						'<div class="board-right">'+
							'<div class="board-user">'+
								'<div class="board-userImg">'+
								'<a href="userPage.do?id='+data[0].b_user_id+'"><img src="resources/images/profileImg/'+ data[0].b_profile_img +'"></a>'+
								'</div>'+
								'<a href="userPage.do?id='+data[0].b_user_id+'"><div class="board-id">'+
										'<p>'+ data[0].b_name +'</p>'+
									'</div></a>'+
								'<div class="board-follow">팔로잉</div>'+
							'</div>'+
							'<div class="board-textDiv">'+
								'<div class="board-text">'+ data[0].b_content +'</div>'+
								'<div class="board-hashtag"></div>'+
							'</div>'+
							'<div class="board-stateicon">'+
								'<div class="board-heartCount">좋아요 234개</div>'+
								'<div class="board-heart">'+
									'<img src="resources/images/icon/menu/iconmonstr-heart-thin-72.png">'+
								'</div>'+
								'<div class="board-etc">'+
									'<img src="resources/images/icon/main/menu1.png">'+
								'</div>'+
							'</div>'+
							'<div class="board-clothesInfo">'+
								
							'</div>'+
						'</div>'+
						'<div class="board-bottom">'+
							'<div class="commentCount">'+
								'<p>댓글 (8)</p>'+
							'</div>'+
							'<div class="board-commentDiv">'+
								'<div class="board-comment">'+
									'<div class="comment-img">'+
										'<a href="./jiman/MyPage.html"><img src="resources/images/mainImg/andy.jpg"></a>'+
									'</div>'+
									'<div class="comment-content">'+
										'<p class="comment-user">iamandy</p>'+
										'<p class="comment-comment">댓글1</p>'+
									'</div>'+
								'</div>'+
								
							'</div>'+
							'<div class="board-commentWrite">'+
								'<div class="comment-write">'+
									'<input type="text" placeholder="댓글 달기...">'+
								'</div>'+
								'<div class="comment-submit" onclick="cSubmit();">게시</div>'+
							'</div>'+
						'</div>');
				
				if(data[0].b_top !=null){
					$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
							'<div class="clothes-img">'+
							'<img src="resources/images/detailImg/top.png">'+
						'</div>'+
						'<div class="clothes-p">상의</div>'+
						'<div class="clothes-info">'+ data[0].b_top +'</div>'+
					'</div>');
				}
				if(data[0].b_bottom !=null){
					$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
							'<div class="clothes-img">'+
							'<img src="resources/images/detailImg/pants.png">'+
						'</div>'+
						'<div class="clothes-p">상의</div>'+
						'<div class="clothes-info">'+ data[0].b_bottom +'</div>'+
					'</div>');
				}
				if(data[0].b_shoes !=null){
					$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
							'<div class="clothes-img">'+
							'<img src="resources/images/detailImg/pants.png">'+
						'</div>'+
						'<div class="clothes-p">상의</div>'+
						'<div class="clothes-info">'+ data[0].b_shoes +'</div>'+
					'</div>');
				}
				if(data[0].b_acc !=null){
					$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
							'<div class="clothes-img">'+
							'<img src="resources/images/detailImg/pants.png">'+
						'</div>'+
						'<div class="clothes-p">상의</div>'+
						'<div class="clothes-info">'+ data[0].b_acc +'</div>'+
					'</div>');
				}
				if(data[0].b_acc !=null){
					$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
							'<div class="clothes-img">'+
							'<img src="resources/images/detailImg/pants.png">'+
						'</div>'+
						'<div class="clothes-p">상의</div>'+
						'<div class="clothes-info">'+ data[0].b_acc +'</div>'+
					'</div>');
				}
				if(data[0].b_etc !=null){
					$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
							'<div class="clothes-img">'+
							'<img src="resources/images/detailImg/pants.png">'+
						'</div>'+
						'<div class="clothes-p">상의</div>'+
						'<div class="clothes-info">'+ data[0].b_etc +'</div>'+
					'</div>');
				}
				
			},
			error:function(request,status,error){
				console.log("** error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + error);
			}
		});
		
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		        detail.style.display = "none";
		        $('.board-detail').empty();
		    }
		}
		function hashAjax(){
			$.ajax({
				url:"BoardDetailHash.do",
				data:{bnum:bnum},
				dataType:"JSON",
				success:function(data){	
					for(var i=0; i<data.length; i++){
						$('.board-hashtag').append('<a href=\'Search.do?keyword='+data[i].substring(1)+'\'>' + data[i] + ' </a>');
					}
				},
				error:function(request,status,error){
					console.log("** error code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + error);
				}
			});
		}
	    
		function getReplyList(){
			$.ajax({
				url:"BoardDetailComm.do",
				data:{bnum:bnum},
				dataType:"JSON",
				success:function(data){	
					console.log(data);
					if(data.length > 0){
						console.log('하하');
					}else{
						$('.board-commentDiv').append(''+
							'<div class="board-comment">'+
								//'<div class="comment-img"></div>'+
								'<div class="comment-content">'+
									'<p class="comment-user">등록된 댓글이 없습니다.</p>'+
									'<p class="comment-comment"></p>'+
								'</div>'+
							'</div>');
					}
				},
				error:function(request,status,error){
					console.log("** error code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + error);
				}
			});
		}
		
	}
    
    
	
    
    
    
    
    
    
    
    
    
    
    
    
    
        // 게시물 마우스오버
        $(document).ready(function(){
            $('.chover').hide();
            $('.content').mouseover(function(){
                $('.chover',this).show();
            });
            $('.content').mouseout(function(){
                $('.chover').hide();
            });
            
            
        });
        
        function infoPage(id){
        	
        	console.log('id:'+ id);
        	//console.log("MyPage.do?uNum="+uNum);
        	location.href="userPage.do?id="+id;
        	
        	
        	
        	
        }
        
        $(document).ready(function(){
        	
        	var uNum = 0${loginUser.user_num};
        	
        	
        		console.log(uNum);
     
        	
			/* var searchUser = new Array();
			var searchUserCount = ${fn:length(searchUser)};
			
	 <c:forEach items="${searchUser}" var="su">
				searchUser.push({num:"${su.user_num}"});
			</c:forEach> 		
			
        	$.ajax({
				url:"searchFollowList.do",
				data:{uNum:uNum},
				dataType:"json",
				success:function(data){
					if(data.length > 0){
						for(var i=0; i<searchUser.length; i++){
							for(var j=0; j<data.length; j++){
								if(searchUser[i].num == data[j].to_follow){
									$("#"+data[j].to_follow).hide();
								}
							}
						}
					}else{
						alert("실패");
					}
				},
				error:function(jqxhr, textStatus,errorThrown){
					console.log("ajax 처리 실패");
				}
			}); */
        });
        
        $(".follow").click(function(e){
        	
        	var followQ = confirm('팔로우 하시겠습니까?');
        	
        	if(followQ){
	            var to_follow = $(this).attr('id');
	    
	            var from_follow = Number(${loginUser.user_num});
	            console.log(to_follow);
	            console.log(from_follow);
	            
	            $.ajax({
					url:"followBtn.do",
					data:{toFollow:to_follow, fromFollow:from_follow},
					type:"post",
					success:function(data){
						if(data == "success"){
							$("#"+to_follow).hide();
						}else{
							alert("실패");
						}
					},
					error:function(jqxhr, textStatus,errorThrown){
						console.log("ajax 처리 실패");
					}
				});
        	}else{
        		
        	}
        });
        
    </script>
</body>
</html>