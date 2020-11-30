<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>찐메인</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="resources/css/final_main2.css">
<link rel="stylesheet" href="resources/css/final_detail.css">
<c:url var="mypage" value="MyPage.do" />
</head>
<body>
	<jsp:include page="WEB-INF/views/common/header.jsp" />
	<script>
		$(function(){
			$.ajax({
				url:"IndexAjax.do",
				dataType:"JSON",
				success:function(data){					
					
					var a = 0;	// tr
					var b = 0;	// data[b]
					
					var row = Math.ceil(data.length/3);		// 총 tr
					
					addTable();
					
					window.onscroll = function (e) {
		        		  if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		        			  if(a<row){
		        				  addTable();
		        			  }		        			  
		        		  }
		        	}
					
					function addTable(){
						boardHover();
						heartIcon();
						for(var i=0; i<7; i++){	// 행
							if(a<row){
								
								$('#table').append('<tr id="'+a+'">');
							
								for(var j=0; j<3; j++){	// 열
									
									if(b < data.length){
										
										$('#'+a).append('<td>'+
													'<div class="content">'+
														'<div>'+
															'<img src="resources/buploadFiles/'+ data[b].image1 +'" class="cImg">'+
														'</div>'+
														'<div class="chover">'+
															'<div class="hover-detail-content" onclick="modalDetail('+data[b].b_num+');"></div>'+
															'<div class="chContnet">'+
																'<div class="user">'+
																	'<div class="userImg">'+
																		'<a href="userPage.do?id='+ data[b].b_user_id +'"><img src="resources/images/profileImg/'+ data[b].b_profile_img +'"></a>'+
																	'</div>'+
																	'<a href="userPage.do?id='+ data[b].b_user_id +'"><div class="userId">'+ data[b].b_name +'</div></a>'+
																'</div>'+
																'<div class="con" onclick="modalDetail('+data[b].b_num+');">'+
																	'<div class="userCon">'+
																		'<p>'+ data[b].b_content +'</p>'+
																	'</div>'+
																'</div>'+
																'<div class="cBtn">'+
																	'<div class="cHeart">'+
																		'<img src="resources/images/icon/main/heart.png"  id="th'+ data[b].b_num +'" class="cheart">'+
																	'</div>'+
																	'<div class="cComment" onclick="modalDetail('+data[b].b_num+');">'+
																		'<div class="cbox"></div>'+
																		'<img src="resources/images/icon/main/comment.png">'+
																	'</div>'+
																	'<div class="cEtc">'+
																		'<img src="resources/images/icon/main/etc.png">'+
																	'</div>'+
																'</div>'+
															'</div>'+
														'</div>'+
													'</div>'+
												'</td>');
										
									}else if(b >= data.length){
										
									}
									b++;
								}
								a++;
							}
						}
						boardHover();
						heartIcon();
					}
				},
				error:function(request,status,error){
					alert("code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + error);
				}
			});
		});
	</script>
	
	<section>
		<!-- ===================================================== 모달 ======================================================== -->
		<div class="myModal" id="myModal" style="display: none;">
			<div class="board-detail" id="board-detail" style="display: none;">
				<!-- <div class="board-img">
					<img src="resources/images/detailImg/theman.jpg">
				</div>
				<div class="board-right">
					<div class="board-user">
						<div class="board-userImg">
							<a href="./jiman/MyPage.html"><img
								src="resources/images/detailImg/40x40man.jpg"></a>
						</div>
						<a href="./jiman/MyPage.html"><div class="board-id">
								<p>__maybenotyet__</p>
							</div></a>
						<div class="board-follow">팔로잉</div>
					</div>
					<div class="board-textDiv">
						<div class="board-text">글 내용</div>
						<div class="board-hashtag">#가을코디 #맨투맨 #맨투맨코디 #흑청바지 #청바지코디
							#캐주얼룩 #캐주얼코디 #남자데일리코디</div>
					</div>
					<div class="board-stateicon">
						<div class="board-heartCount">좋아요 234개</div>
						<div class="board-heart">
							<img
								src="resources/images/icon/menu/iconmonstr-heart-thin-72.png">
						</div>
						<div class="board-etc">
							<img src="resources/images/icon/main/menu1.png">
						</div>
					</div>
					<div class="board-clothesInfo">
						<div class="clothesInfo-div">
							<div class="clothes-img">
								<img src="resources/images/detailImg/top.png">
							</div>
							<div class="clothes-p">상의</div>
							<div class="clothes-info">아디다스</div>
						</div>
						<div class="clothesInfo-div">
							<div class="clothes-img">
								<img src="resources/images/detailImg/pants.png">
							</div>
							<div class="clothes-p">하의</div>
							<div class="clothes-info">아디다스</div>
						</div>
						<div class="clothesInfo-div">
							<div class="clothes-img">
								<img src="resources/images/detailImg/shoes.png">
							</div>
							<div class="clothes-p">신발</div>
							<div class="clothes-info">아디다스</div>
						</div>
						<div class="clothesInfo-div">
							<div class="clothes-img">
								<img src="resources/images/detailImg/watch.png">
							</div>
							<div class="clothes-p">Acc</div>
							<div class="clothes-info">아디다스</div>
						</div>
						<div class="clothesInfo-div">
							<div class="clothes-img">
								<img src="resources/images/detailImg/bag.png">
							</div>
							<div class="clothes-p">Etc</div>
							<div class="clothes-info">아디다스</div>
						</div>
					</div>
				</div>
				<div class="board-bottom">
					<div class="commentCount">
						<p>댓글 (8)</p>
					</div>
					<div class="board-commentDiv">
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
					</div>
					<div class="board-commentWrite">
						<div class="comment-write">
							<input type="text" placeholder="댓글 달기...">
						</div>
						<div class="comment-submit">게시</div>
					</div>
				</div> -->
			</div>
		</div>
		<!-- ===================================================== 모달 ======================================================== -->
		<div class="scContent">
			<div class="upBtn">
				<img src="resources/images/icon/main/arrow.png">
			</div> 
			<c:if test="${loginUser ne null}">
			<div class="postBtn">
				<img src="resources/images/icon/main/plus.png">
			</div>
			</c:if>
			<div class="choice">
				<p class="pchoice">체형별 보기</p>
				<div class="choice1">
					<div class="cSelect">
						키 : <select name="height">
							<option value="">---</option>
							<option value="1">140cm 이하</option>
							<option value="2">140~150cm</option>
							<option value="3">150~160cm</option>
							<option value="4">160~170cm</option>
							<option value="5">170~180cm</option>
							<option value="6">180~190cm</option>
							<option value="7">190cm 이상</option>
						</select>&nbsp;&nbsp;&nbsp; 몸무게 : <select name="weight">
							<option value="">---</option>
							<option value="1">40kg 이하</option>
							<option value="2">40~50kg</option>
							<option value="3">50~60kg</option>
							<option value="4">60~70kg</option>
							<option value="5">70~80kg</option>
							<option value="6">80~90kg</option>
							<option value="7">90~100kg</option>
							<option value="8">100kg 이상</option>
						</select>&nbsp;&nbsp;&nbsp;
						<div class="choiceBtn">체형별 보기</div>
					</div>
					<div class="close">
						<img src="resources/images/icon/main/close.png">
					</div>
				</div>
			</div>
			<div class="ctable">
				<table id="table">
					
				</table>
			</div>
		</div>
		<div class="modal2" id="modal2" style="display: none;"></div>
        <div class="md_content" id="md_content" style="display: none;">
            <span id="text">업로드</span>
            <button class="xbutton">X</button>
            <hr style="border: solid 0.5px rgb(211, 211, 211);">

            <div class="post-style-div" onclick="postStyle();">
                <div class="post-style-btn"><img class="posticon" src="resources/images/icon/main/sunglasses.png"></div>
                <div class="post-style-p">스타일</div>
            </div>

            <div class="post-qna-div" onclick="postQna();">
                <div class="post-qna-btn"><img class="posticon" src="resources/images/icon/main/QandA.png"></div>
                <div class="post-qna-p">QnA</div>
            </div>
        </div>
	</section>

	<jsp:include page="WEB-INF/views/common/footer.jsp" />


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
				
				var bnum = $('.cheart',this).attr("id");
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
		}


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
									'<div class="board-follow">팔로잉</div>'+
								'</div>'+
								'<div class="board-textDiv">'+
									'<div class="board-text">'+ data[0].b_content +'</div>'+
									'<div class="board-hashtag"></div>'+
								'</div>'+
								'<div class="board-stateicon">'+
									'<div class="board-heartCount"></div>'+
									'<div class="board-heart">'+
										'<img src="resources/images/icon/menu/iconmonstr-heart-thin-72.png" id="h'+bnum+'" onclick="addHeart('+bnum+');">'+
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
			
			function hashHeartAjax(){
				// 해쉬태그 불러오기
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
			
			// 디테일 댓글 리스트
			function replyList(){
				$.ajax({
					url:"BoardDetailComm.do",
					data:{bnum:bnum},
					dataType:"JSON",
					success:function(data){	
						if(data.length > 0){
							console.log(data);
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
											'<p class="comment-user">'+ data[i].uname +'</p>'+
											'<p class="comment-comment">'+ data[i].c_content +'</p>'+
										'</div>'+
									'</div>');
							}
							
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
			
		}
		
		function addHeart(bnum){
			var bnum = bnum;
			var unum = '<c:out value="${loginUser.user_num}"/>';
			
			if(unum.length > 0){
				//빈하트일때 좋아요 등록
				if($('#h'+bnum).attr('src') == "resources/images/icon/menu/iconmonstr-heart-thin-72.png"){
					$.ajax({
						url:"BoardAddHeart.do",
						data:{bnum:bnum, unum:unum},
						success:function(data){	
							if(data == "success"){
								$('#h'+bnum).attr('src','resources/images/icon/menu/detailHeart.png');
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
				}else if($('#h'+bnum).attr('src') == 'resources/images/icon/menu/detailHeart.png'){
					$.ajax({
						url:"BoardDelHeart.do",
						data:{bnum:bnum, unum:unum},
						success:function(data){	
							if(data == "success"){
								$('#h'+bnum).attr("resources/images/icon/menu/iconmonstr-heart-thin-72.png");
								heartIcon()
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
		}
		
		
		// 댓글등록 ajax
		function cSubmit(){
			var comment = $('.c-content').val();
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
		
		// 댓글 리스트 ajax
		function getReplyList(bnum){
			console.log('댓글 리스트 ajax 실행');
			console.log('해당 댓글 글넘 : ' + bnum);
			$.ajax({
				url:"BoardDetailComm.do",
				data:{bnum:bnum},
				dataType:"JSON",
				success:function(data){	
					if(data.length > 0){
						console.log(data);
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
										'<p class="comment-user">'+ data[i].uname +'</p>'+
										'<p class="comment-comment">'+ data[i].c_content +'</p>'+
									'</div>'+
								'</div>');
						}
						
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