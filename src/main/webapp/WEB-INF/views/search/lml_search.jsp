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
											></div>
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
													>
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
	
		// 하트 리스트
		function heartIcon(){
			
			var unum = '<c:out value="${loginUser.user_num}"/>';
			
			if(unum.length > 0){
				$.ajax({
					url:"BoardHeart.do",
					data:{unum:unum},
					success:function(data){	
						if(data.length > 0){
							for(var i=0; i<data.length; i++){
								$('#th'+data[i]).attr('src','resources/images/icon/main/heart2.png');
							}
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
		$(function(){
		  	$('.chover').hide();
		    $('.content').mouseover(function(){
		        $('.chover',this).show();
		    });
		    $('.content').mouseout(function(){
		        $('.chover').hide();
		    });
		    
		    /* 게시물 좋아요 아이콘 클릭 시 아이콘 변경 */
			$(".cHeart").click(function(){
				
				var bnum = $('.cheart',this).attr("id").substring(2);
				var unum = '<c:out value="${loginUser.user_num}"/>';
				
				if(unum.length > 0){
					
					//빈하트일때 좋아요 등록
					if($('.cheart',this).attr('src') == "resources/images/icon/main/heart.png"){
						
						$.ajax({
							url:"BoardAddHeart.do",
							data:{bnum:bnum, unum:unum},
							success:function(data){	
								if(data == "success"){
									$('#th'+bnum).attr('src','resources/images/icon/main/heart2.png');
								}else{
									alert('좋아요 실패');
								}
							},
							error:function(request,status,error){
								console.log("** error code : " + request.status + "\n"
									+ "message : " + request.responseText + "\n"
									+ "error : " + error);
							}
						});
						
					//꽉찬하트일때 좋아요 취소
					}else if($('.cheart',this).attr('src') == "resources/images/icon/main/heart2.png"){
						
						 $.ajax({
							url:"BoardDelHeart.do",
							data:{bnum:bnum, unum:unum},
							success:function(data){	
								if(data == "success"){
									$('#th'+bnum).attr('src','resources/images/icon/main/heart.png');
								}else{
									alert('좋아요 취소 실패');
								}
							},
							error:function(request,status,error){
								console.log("** error code : " + request.status + "\n"
									+ "message : " + request.responseText + "\n"
									+ "error : " + error);
							}
						});
				 	} 
				}else{
					alert('로그인 후 이용 가능합니다.');
				}
			});
		});


		/* 체형별 */
		$( document ).ready( function() {
		    $('.choice1').hide();
		    $( '.pchoice' ).click( function() {
		        $( '.choice' ).animate( {
		            width: '1106px',
		            height: '50px',
		            cursor: 'pointer'
		        }, 400 );
		        $('.choice').css('cursor','default');
		        $('.choice1').show();
		        $('.pchoice').hide();
		    } );
		    $( '.close' ).click( function() {
		        $( '.choice' ).animate( {
		            width: '100px',
		            height: '30px'
		        }, 400 );
		        $('.choice1').hide();
		        setTimeout(function() {
		            $('.pchoice').show();
		        }, 400);
		        $('.choice').css('cursor','pointer');
		    } );

		});
          

		/* 맨 위로 가는 버튼 */
		$( document ).ready( function() {
		    $('.upBtn').hide();
		    $( window ).scroll( function() {
		        if ( $( this ).scrollTop() > 200 ) {
		            $( '.upBtn' ).fadeIn();
		        } else {
		            $( '.upBtn' ).fadeOut();
		        }
		    });
		    $( '.upBtn' ).click( function() {
		        $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
		        return false;
		    });
		});

		/* 모달팝업 디테일 */
		function modalDetail(bnum){
			
			console.log('### 글넘 : ' + bnum);
			
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
					hashHeartAjax();
					hashUSerAjax();
					replyList();
					
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
									'<div class="board-follow" id="fo'+data[0].b_user_num+'" onclick="addFollow(id);"></div>'+
								'</div>'+
								'<div class="board-textDiv">'+
									'<div class="board-text">'+ data[0].b_content +'</div>'+
									'<div class="board-hashtag"></div>'+
									'<div class="board-Usertag"></div>'+
								'</div>'+
								'<div class="board-stateicon">'+
									'<div class="board-heartCount"></div>'+
									'<div class="board-heart">'+
										'<img src="resources/images/icon/menu/iconmonstr-heart-thin-72.png" id="h'+bnum+'" onclick="addHeart('+bnum+');">'+
									'</div>'+
									'<div class="board-etc">'+
		                              '<img src="resources/images/icon/main/menu1.png">'+
		                              '<ul class="boardSub">'+
		                              '</ul>'+
		                           '</div>'+
								'</div>'+
								'<div class="board-clothesInfo">'+
									
								'</div>'+
							'</div>'+
							'<div class="board-bottom">'+
								'<div class="commentCount">'+
									
								'</div>'+
								'<div class="board-commentDiv">'+
									
								'</div>'+
								'<div class="board-commentWrite">'+
									'<div class="comment-write">'+
										'<input type="text" id="'+bnum+'" class="c-content" placeholder="댓글 달기...">'+
									'</div>'+
									'<div class="comment-submit" onclick="cSubmit();">게시</div>'+
								'</div>'+
							'</div>');
					
					followList(data[0].b_user_num);
					boardSub(data[0].b_user_num, bnum);
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
			
			
			function boardSub(bunum, bnum){
	        	var unum = '<c:out value="${loginUser.user_num}"/>';
	            var bunum = bunum;
	            var bnum = bnum;
	            
	            console.log('비넘 넘어와줘 ' + bnum)
	            
	            $('.boardSub').hide();
	            $('.board-etc').click(function(){
	            	$('ul',this).slideToggle("fast");
	            	if(unum.length>0){
		            	if(unum == bunum){
		               		$('.boardSub').append('<a href="bUpdateView.do?bnum='+bnum+'"><li><div class="boardSub1">수정</div></li></a>'+
                                    			'<a href="#"><li><div class="boardSub1">삭제</div></li></a>');      	
		               	}else{
		               		$('.boardSub').append('<a href="#"><li><div class="boardSub1">신고</div></li></a>');
		            	}
		            }else{
	               		$('.boardSub').append('<a href="#"><li><div class="boardSub1">신고</div></li></a>');
	            	}
	            });
	        }
	           
	           $("body").click(function(e){
	               if(!$('.board-etc').has(e.target).length){
	                   $('.boardSub').hide();
	               }
	           });
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			function hashHeartAjax(){
				// 해쉬태그 불러오기
				//게시글 해쉬태그
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
				//사용자태그
			
				
				
				
				
				// 디테일 좋아요 리스트 & 내가 좋아요 눌렀음 빨간하트로.
				$.ajax({
					url:"BoardDetailHeart.do",
					data:{bnum:bnum},
					dataType:"JSON",
					success:function(data){
						$('.board-heartCount').html('좋아요 '+ data.length +'개');
						if(data.length > 0){
							var unum = '<c:out value="${loginUser.user_num}"/>';
							for(var i=0; i<data.length; i++){
								if(data[i].h_unum == unum){
									$('#h'+bnum).attr('src','resources/images/icon/menu/detailHeart.png');
								}
							}
						}
					},
					error:function(request,status,error){
						console.log("** error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + error);
					}
				});
			}
			
			
			
			
			function hashUSerAjax(){
				$.ajax({
					url:"UserDetailHash.do",
					data:{bnum:bnum},
					dataType:"JSON",
					success:function(data){	
						for(var i=0; i<data.length; i++){
				$('.board-Usertag').append('<a href=\'Search.do?keyword='+data[i]+'\'>' +"@" +data[i] + ' </a>');
						}
					},
					error:function(request,status,error){
						console.log("** error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + error);
					}
				});
				
			}
			
			
			
			
			function followList(bunum){
				// 디테일 팔로우리스트 가져오기
				var unum = '<c:out value="${loginUser.user_num}"/>';
				var bunum = bunum;
				if(unum.length>0){
					if(unum != bunum){
						$.ajax({
							url:"BoardDetailFollowList.do",
							data:{unum:unum,bunum:bunum},
							success:function(data){
								if(data == 0){
									$('.board-follow').html('팔로우');
								}else if(data == 1){
									console.log('팔로우 했음 1 : ' + data);
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
			}
			
			// 디테일 댓글 리스트
			function replyList(){
				$.ajax({
					url:"BoardDetailComm.do",
					data:{bnum:bnum},
					dataType:"JSON",
					success:function(data){	
						if(data.length > 0){
							var unum1 = '<c:out value="${loginUser.user_num}"/>';
							$('.commentCount').empty();
							$('.commentCount').append('<p>댓글 ('+data.length+')</p>');
							$('.board-commentDiv').empty();
							for(var i=0; i<data.length; i++){
								$('.board-commentDiv').append(''+
										'<div class="board-comment">'+
										'<div class="comment-img">'+
											'<a href="./jiman/MyPage.html"><img src="resources/images/profileImg/'+ data[i].profile +'"></a>'+
										'</div>'+
										'<div class="comment-content">'+
											'<p class="comment-user" id="tag'+data[i].c_unum+'" onclick="tagComment(id);">'+ data[i].uname +'</p>'+
											'<p class="comment-comment">'+ data[i].c_content +'</p>'+
											'<div class="comment-delete del'+data[i].c_no+'"></div>'+
										'</div>'+
									'</div>');
								$('.board-commentDiv').scrollTop($('.board-commentDiv').prop('scrollHeight'));
								if(data[i].c_unum == unum1){	// 댓글 단 사람이랑 로그인유저랑 같으면
									$('.del'+data[i].c_no).append('<img src="resources/images/icon/menu/commentDelete.png" id="'+data[i].c_no+'" onclick="commentDelete(id,'+bnum+');">');
								}
							}
							
							
						}else{
							//$('.commentCount').empty();
							$('.commentCount').append('<p>댓글 ('+data.length+')</p>');
							//$('.board-commentDiv').empty();
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
		
		function addFollow(bunum){
			var fromFollow = '<c:out value="${loginUser.user_num}"/>';
			var toFollow = bunum.substring(2);
			
			if(fromFollow.length>0){
				var qfollow = confirm('팔로우 하시겠습니까?');
				if(qfollow == true){
					$.ajax({
						url:"followBtn.do",
						data:{toFollow:toFollow, fromFollow:fromFollow},
						type:"post",
						success:function(data){
							if(data == "success"){
								$('#'+bunum).html('');
							}else{
								alert("실패");
							}
						},
						error:function(jqxhr, textStatus,errorThrown){
							console.log("ajax 처리 실패");
						}
					});
				}
			}else{
				alert('로그인 후 이용 가능합니다.');
			}
		}
		
		function addHeart(bnum){
			var bnum = bnum;
			var unum = '<c:out value="${loginUser.user_num}"/>';
			
			if(unum.length > 0){
				// 디테일 빈하트일때 좋아요 등록
				if($('#h'+bnum).attr('src') == "resources/images/icon/menu/iconmonstr-heart-thin-72.png"){
					$.ajax({
						url:"BoardAddHeart.do",
						data:{bnum:bnum, unum:unum},
						success:function(data){	
							if(data == "success"){
								$('#h'+bnum).attr('src','resources/images/icon/menu/detailHeart.png');
								$('#th'+bnum).attr('src','resources/images/icon/main/heart2.png');
								detailHeartCount();
							}else{
								alert('좋아요 실패');
							}
						},
						error:function(request,status,error){
							console.log("** error code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + error);
						}
					});
					
				//디테일 꽉찬하트일때 좋아요 취소
				}else if($('#h'+bnum).attr('src') == 'resources/images/icon/menu/detailHeart.png'){
					$.ajax({
						url:"BoardDelHeart.do",
						data:{bnum:bnum, unum:unum},
						success:function(data){	
							if(data == "success"){
								$('#h'+bnum).attr('src','resources/images/icon/menu/iconmonstr-heart-thin-72.png');
								$('#th'+bnum).attr('src','resources/images/icon/main/heart.png');
								detailHeartCount();
							}else{
								alert('좋아요 취소 실패');
							}
						},
						error:function(request,status,error){
							console.log("** error code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + error);
						}
					});
			 	} 
				
				function detailHeartCount(){
					$.ajax({
						url:"BoardDetailHeart.do",
						data:{bnum:bnum},
						dataType:"JSON",
						success:function(data){
							$('.board-heartCount').html('좋아요 '+ data.length +'개');
						},
						error:function(request,status,error){
							console.log("** error code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + error);
						}
					});
				}
			}else{
				alert('로그인 후 이용 가능합니다.');
			}
		}
		
		
		// 댓글등록 ajax
		function cSubmit(){
			var comment = $('.c-content').val();
			comment.split("@");
			var unum = '<c:out value="${loginUser.user_num}"/>';
			var bnum = $('.c-content').attr("id");
			
			if(unum.length>0){
				if(comment.length > 0){
					$.ajax({
						url:"BoardComment.do",
						data:{comment:comment, unum:unum, bnum:bnum},
						success:function(data){	
							if(data == "success"){
								getReplyList(bnum);
								$('.c-content').val('');
								$('.board-commentDiv').scrollTop($('.board-commentDiv').prop('scrollHeight'));
							}else{
								alert('댓글 등록 실패');
							}
						},
						error:function(request,status,error){
							console.log("** error code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + error);
						}
					});
				}else{
					alert('댓글을 입력해주세요.');
				}
			}else{
				alert('로그인 후 이용 가능합니다.');
			}
		}
		
		var tagname ="";
		// 태그 댓글등록 ajax
		function tagComment(id){
			var tagunum = id.substring(3);
			tagname = tagname+"@"+ $('#'+id).html();
			
			
			$('.c-content').val(tagname+' ');
			
			
		}
		
		// 댓글 리스트 ajax
		function getReplyList(bnum){
			console.log('해당 댓글 글넘 : ' + bnum);
			$.ajax({
				url:"BoardDetailComm.do",
				data:{bnum:bnum},
				dataType:"JSON",
				success:function(data){	
					if(data.length > 0){
						var unum1 = '<c:out value="${loginUser.user_num}"/>';
						$('.commentCount').empty();
						$('.commentCount').append('<p>댓글 ('+data.length+')</p>');
						$('.board-commentDiv').empty();
						for(var i=0; i<data.length; i++){
							$('.board-commentDiv').append(''+
									'<div class="board-comment">'+
									'<div class="comment-img">'+
										'<a href="./jiman/MyPage.html"><img src="resources/images/profileImg/'+ data[i].profile +'"></a>'+
									'</div>'+
									'<div class="comment-content">'+
										'<p class="comment-user" id="tag'+data[i].c_unum+'" onclick="tagComment(id);">'+ data[i].uname +'</p>'+
										'<p class="comment-comment">'+ data[i].c_content +'</p>'+
										'<div class="comment-delete del'+data[i].c_no+'"></div>'+	//id="del'+data[i].c_unum+'"
									'</div>'+
								'</div>');
							if(data[i].c_unum == unum1){
								$('.del'+data[i].c_no).append('<img src="resources/images/icon/menu/commentDelete.png" id="'+data[i].c_no+'" onclick="commentDelete(id,'+bnum+');">');
							}
						}
						console.log("scrollHeight : " + $('.board-commentDiv').prop('scrollHeight'));
						$('.board-commentDiv').scrollTop($('.board-commentDiv').prop('scrollHeight'));
					}else{
						console.log(data.length);
						//$('.commentCount').empty();
						$('.commentCount').append('<p>댓글 ('+data.length+')</p>');
						//$('.board-commentDiv').empty();
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
		
		// 댓글 삭제
		function commentDelete(id,bnum){
			console.log('삭제 아뒤, 비넘 : ' + id + ', ' + bnum);
			var del = confirm('댓글을 삭제하시겠습니까?');
			if(del == true){
				$.ajax({
					url:"CommentDelete.do",
					data:{cno:id},
					success:function(data){	
						if(data == "success"){
							getReplyList(bnum);
						}else{
							alert('댓글 삭제 실패');
						}
					},
					error:function(request,status,error){
						console.log("** error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + error);
					}
				});
			}else{}
		}

		
 
		var modal2 = document.getElementById('modal2');
		var md_content = document.getElementById('md_content'); 
      
		$('.postBtn').click(function(){
			$( 'html, body' ).animate( { scrollTop : 0 },0);
			$('.modal2').css('display','block');
			$('.md_content').css('display','block');
		});

		window.onclick = function(event) {
		    if (event.target == modal2) {
		        modal2.style.display = "none";
		        md_content.style.display = "none";
		    }
		}

		$('.xbutton').click(function(){
		    modal2.style.display = "none";
		    md_content.style.display = "none";
		});
		
		function postStyle(){
		    location.href="PostStyle.do";
		}
		
		function postQna(){
		    location.href="PostQna.do";
		}
		
		
		function infoPage(id){
			location.href="userPage.do?id="+id;
		}
    </script>
</body>
</html>